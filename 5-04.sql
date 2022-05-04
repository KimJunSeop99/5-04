-- DML (DATA Manipulation Language) : ������ ���۾�
-- ���� ������ ���� ���̺� ��Ϻ���
SELECT * FROM USER_TABLES;

-- ����) ROLLACK / COMMIT
-- *Ʈ�����(Transaction) ����
-- ROLLACK : INSERT/UPDATE/DELETE ������ ����ϴ� ��
-- COMMIT : INSERT/UPDATE/DELETE ���� ���� �ݿ�
-- ��) Ʈ����� ����
--     insert ~
--     update ~
--     delete ~
--     commit [rollback] : Ʈ����� ���� (1���� Ʈ�����)
-- ����) AUTOCOMMIT : �ڵ� DB ���� �ݿ�
-- ORACLE DB : AUTOCOMMIT = FALSE
-- MASQL/MARIADB : AUTOCOMMIT = TRUE

-- ������ ������ ���̺� ��Ϻ��� SQL��ɾ�
SELECT * FROM USER_TABLES;

-- DROP TABLE : ���̺� ����  
--DROP TABLE TB_DEPARTMENT;

-- �������� 1) EMPLOYEE ���̺��� ������ �����Ͽ� EMP_INSERT�� �̸��� �� ���̺��� ����.
    CREATE TABLE EMP_INSERT AS SELECT * 
    FROM EMPLOYEE WHERE 1=2; -- ���� ���� (������ ����, ������X)
-- 2) ������ EMP_INSERT(�ӽ� �������̺�) ���̺� �߰��ϵ�, 
--    SYSDATE�� �̿��ؼ� �Ի����� ���÷� �Է�.
-- ���̺� �������¹�
DESC EMP_INSERT; 
-- �÷� ��Ϻ��� ��ųʸ�
SELECT * FROM USER_TAB_COLUMNS
ORDER BY TABLE_NAME;
-- ���̺� ������ �ֱ� ( �÷��� ���ڿ� , ���� , NULL ���� ��Ȯ�� ���缭 �Է�)
    INSERT INTO EMP_INSERT -- INSERT �κп� (ENO, ENAME) �� �÷��� �־ �Է°���
    VALUES(1,'JUNSEOP','STAFF',NULL,SYSDATE,2700,230,10);
    
    SELECT * FROM EMP_INSERT;
-- 3) EMP_INSERT(�ӽ� �������̺�) ���̺� �� ����� �߰��ϵ� TO_DATE �Լ���
--    �̿��ؼ� �Ի����� ������ �Է�.
    INSERT INTO EMP_INSERT
    VALUES(2,'Kim','STUDENT',NULL,TO_DATE(SYSDATE-1,'YY/MM/DD'),1150,NULL,20);
-- 4) EMPLOYEE ���̺��� ������ ������ �����Ͽ� EMP_COPY�� �̸��� ���̺� ����.
    CREATE TABLE EMP_COPY
    AS
    SELECT * FROM EMPLOYEE;

-- 10������ : DML(������ ���۾�) �ǽ�
-- 5) �����ȣ�� 7788�� ����� �μ���ȣ�� 10������ �����Ͻÿ�.
    UPDATE EMP_COPY
    SET DNO = 10
    WHERE ENO = 7788;
-- 6) �����ȣ 7788�� ������(JOB) �� �޿�(SALARY)�� �����ȣ 7499��
-- ������ �� �޿��� ��ġ�ϵ��� �����Ͻÿ�.
    UPDATE EMP_COPY
    SET (JOB, SALARY) = (SELECT JOB, SALARY FROM EMP_COPY WHERE ENO = 7499)
    WHERE ENO = 7788;
    SELECT * FROM EMP_COPY;
-- 7) DEPARTMENT ���̺��� ������ ������ �����Ͽ� DEPT_COPY�� �̸��� ���̺���
--    ����.
    CREATE TABLE DEPT_COPY AS SELECT * FROM DEPARTMENT;

-- 8) DEPT_COPY ���̺��� �μ���(DNAME)�� RESERCH�� �μ��� ����.
    DELETE FROM DEPT_COPY
    WHERE DNAME = 'RESERCH';
-- 9) DEPT_COPY ���̺��� �μ� ��ȣ�� 10�̰ų� 40�� �μ��� ����.
    DELETE FROM DEPT_COPY
    WHERE DNO IN(10, 40);
    
    COMMIT;
-- �������� 10) DEPT_COPY ���̺��� �μ���(DNAME)�� 'SALES'�̸�
--         ������(LOC)�� 'SEOUL'�̶�� �����ϰ�, �ƴϸ� 'BUSAN' ����.
    UPDATE DEPT_COPY
    SET LOC = DECODE (DNAME,'SALES','SEOUL'
                                    ,'BUSAN');

-- 2022-05-04 ������ ���Ἲ(PK/EK)�ǽ�
-- ��������(Constraint)
-- ���̺��� �÷��� ��ȿ���� ���� ���� �ɷ����� ���� �ɾ��ִ� ��.
-- ���Ἲ �������� 
-- 1) NOT NULL ����
CREATE TABLE CUSTOMER(
    ID VARCHAR2(20) NOT NULL,
    PWD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(30),
    ADDRESS VARCHAR2(100)
);

-- NOT NULL : INSERT �׽�Ʈ
INSERT INTO CUSTOMER
VALUES(NULL, NULL, NULL, '010-1111-1111','BUSAN'); -- �������� ������ ������.

-- 2) UNIQUE : ���̺��� �÷��� �����Ͱ� ������ ������ ���� �� �� �ְ� ��. (�ߺ� ���X)
CREATE TABLE CUSTOMER2(
    ID VARCHAR2(20) UNIQUE,
    PWD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(30),
    ADDRESS VARCHAR2(100)
);

-- NULL : UNIQUE �������ǿ� ���ݵ������� (NULL�� �ߺ�����)
INSERT INTO CUSTOMER2
VALUES('1', '1111', 'ȫ�浿', '010-1111-1111','BUSAN');
VALUES('1', '1111', '�̼���', '010-1111-1111','BUSAN'); -- ID�� UNIQUE �ߺ��ȵ����� ����!!

SELECT * FROM CUSTOMER2;

-- �������ǿ� �̸��� ������ �� ����
CREATE TABLE CUSTOMER3(
    ID VARCHAR2(20) CONSTRAINT UK_ID UNIQUE,
    PWD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(30),
    ADDRESS VARCHAR2(100)
);

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'CUSTOMER3';

-- 3) PRIMARY KEY *****
-- UNIQUE + NOT NULL ȿ�� : ������ �� + NOT NULL���� + INDEX������(�ڵ�)

CREATE TABLE CUSTOMER4(
    ID VARCHAR2(20),
    PWD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(30),
    ADDRESS VARCHAR2(100),
    CONSTRAINT PK_ID PRIMARY KEY(ID)
);


INSERT INTO CUSTOMER4
VALUES(NULL, '1111', 'ȫ�浿', '010-1111-1111','BUSAN'); -- �������� ����
INSERT INTO CUSTOMER4
VALUES(NULL, '1111', '�̼���', '010-1111-1111','BUSAN'); -- �������� ����

-- 4) FOREIGN KEY : �����Ǵ� ���̺� �÷� ���� �׻� ���������
-- �θ����̺� (ID : 1,2,3) �ڽ����̺� (ID : 1,2,3, FDSA)
-- �� ) �θ����̺� : �μ����̺�(����,���,�) , �ڽ����̺� (����,���,�)
SELECT * FROM DEPARTMENT;
-- FK �׽�Ʈ ���̺�
CREATE TABLE EMP_SECOND (
    ENO NUMBER(4) CONSTRAINT PK_ENO PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    DNO NUMBER(2) CONSTRAINT FK_DNO2 REFERENCES DEPARTMENT);
--        : ���� => FK(���� ���Ἲ)

INSERT INTO EMP_SECOND(ENO, ENAME, DNO)
VALUES(8000, '�̼���',40);

-- DEFAULT �������� :
-- �÷��� �����Ͱ� �ƹ��� ���� �Էµ��� �ʾ��� �� ����Ʈ�� ������ ���� �Էµ�

CREATE TABLE EMP_THIRD (
    ENO NUMBER(4) CONSTRAINT PK_ENO2 PRIMARY KEY,
    ENAME VARCHAR2(10),
    SALARY NUMBER(7,2) DEFAULT 1000);
    -- DEFAULT �׽�Ʈ
    INSERT INTO EMP_THIRD(ENO, ENAME)
    VALUES(8000,'ȫ�浿');
    -- ������ Ȯ��
    SELECT * FROM EMP_THIRD;
    
-- ���̺� ����
SELECT TABLE_NAME FROM USER_TABLES;
DROP TABLE EMP_INSERT;

-- EMP_COPY ���̺�:
CREATE TABLE EMP_COPY
AS
SELECT *
FROM EMPLOYEE;

-- DEPT_COPY ���̺�:
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPARTMENT;

-- ���̺� ����� �� �Ŀ� �������� �ɱ�
ALTER TABLE EMP_COPY
ADD CONSTRAINT PK_EMP_COPY_ENO PRIMARY KEY(ENO);

ALTER TABLE DEPT_COPY
ADD CONSTRAINT PK_EMP_COPY_DNO PRIMARY KEY(DNO);

-- �������� ���� ��ųʸ� SQL��
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP_COPY';

-- �������ǿ� ���� ���̺�, �÷��� ���� SQL��
SELECT B.TABLE_NAME, A.COLUMN_NAME, B.CONSTRAINT_TYPE
FROM    USER_CONS_COLUMNS A,
        USER_CONSTRAINTS B
WHERE A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
AND B.TABLE_NAME NOT LIKE 'BIN%'
ORDER BY B.TABLE_NAME;
-- FOENIGN KEY ����
ALTER TABLE EMP_COPY
ADD CONSTRAINT FK_EMP_COPY_DNO
FOREIGN KEY(DNO) REFERENCES DEPT_COPY(DNO);

-- ���������� ������ �� ����.�ϱ�
-- ����) ���� �ڽ����̺��� FOREIGN KEY �� ����.�ϰ� ,
--      �θ����̺��� PRIMARY KEY�� ����.�ؾ���
ALTER TABLE DEPT_COPY
DROP PRIMARY KEY; -- ����

-- �˾Ƽ� ����.�� �ּ���
-- CASCADE : PRIMARY KEY�� ���ÿ� ���ÿ� 
--           �ڽ����̺��� FOREING KEY�� ã�Ƽ� �˾Ƽ� ����.��
ALTER TABLE DEPT_COPY
DROP PRIMARY KEY CASCADE;

-- �������� 1�� : ��������(Constraint) �ǽ�
-- 1) EMPLOYEE ���̺��� ������ �����Ͽ� EMP_SAMPLE�̶� �̸��� ���̺��� ����ÿ�.
CREATE TABLE EMP_SAMPLE AS SELECT * FROM EMPLOYEE;
DROP TABLE EMP_SAMPLE;
CREATE TABLE EMP_SAMPLE AS SELECT * FROM EMPLOYEE WHERE 1=2;
-- ��� ���̺��� �����ȣ �÷�(ENO)�� ���̺� ������ PRIMARY KEY ���������� �����ϵ�,
DESC EMP_SAMPLE;
-- ���� ���� �̸��� PK_MY_EMP �� �Ͻÿ�.
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT PK_MY_EMP PRIMARY KEY(ENO);

-- 2) DEPARTMENT ���̺��� ������ �����Ͽ� DEPT_SAMPLE�� �̸��� ���̺��� ����.
-- �μ���ȣ �÷�(DNO)�� PRIMARY KEY ���������� �����ϵ�,
-- �������� �̸��� PK_MY_DEPT �Ͻÿ�.
CREATE TABLE DEPT_SAMPLE AS SELECT * FROM DEPARTMENT WHERE 1=2;
DROP TABLE DEPT_SAMPLE;

ALTER TABLE DEPT_SAMPLE
ADD CONSTRAINT PK_MY_DEPT PRIMARY KEY(DNO);

-- 3) ��� ���̺��� �μ���ȣ �÷��� �������� �ʴ� �μ��� ����� �������� �ʵ���
--    �ܷ� Ű(FOREIGN KEY: FK) ���������� �����ϵ�, FK_MY_DEPT_EMP�� �Ͻÿ�.
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT FK_MY_DEPT_EMP
FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DNO);


