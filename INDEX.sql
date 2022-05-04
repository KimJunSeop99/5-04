-- 2022 05 04 INDEX ����(*****)
-- ��� �÷��� ������ ��
-- �ε��� ���� : ��ȸ (SELECT) ������ ���̱� ���ؼ� �ε����� ����
-- �ε��� �˰��� : B* TREE (�˻� �ӵ� ��� �˰���)
-- �� )
-- ���� : CREATE INDEX �ε����̸� ON ���̺��(�÷���);
-- �ε����� �ɾ�� �ϴ� �÷�
-- 1) ���̺� ���� ���� �ʹ� ������ : EX)10���� �̻�
-- 2) WHERE���� ��� �÷��� �ʹ� ���� ���ö�
-- 3) �˻� ����� ��ü�� �뷫 2%~5%���� ���ö� (�ݴ�� 10%�̻� �ε��� �ɸ� �� ������)
-- 4) ���ο� ���Ǵ� �÷��� �ε����� �Ŵ°��� ��� ......
CREATE INDEX IDX_EMPLOYEE_ENAME
ON EMPLOYEE(ENAME);

-- �ε��� ���� Ȯ��(�ε��� ���� ��ųʸ�)
SELECT * FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEE';

-- �ε��� ����
DROP INDEX IDX_EMPLOYEE_ENAME;

-- ���� �ε���
CREATE INDEX IDX_DEPT_COM
-- �ε����� 1�� �÷��� 2��
ON DEPARTMENT(DNAME, LOC);

-- Ư��) �Լ� ��� �ε��� : �����̳� �Լ��� �����ؼ� ���� �ε���
CREATE INDEX IDX_EMP_ANNSAL
ON EMPLOYEE(SALARY*12);

-- �������� 1) : ������ & �ε��� �ǽ�
-- 1) ��� ���̺��� �����ȣ�� �ڵ����� �����ǵ��� ������ ����.
-- ������ �̸� : SQ_EMP , ���۹�ȣ : 1, ���� : 1, �ִ밪 : 100000
CREATE SEQUENCE SQ_EMP 
INCREMENT BY 1 START WITH 1 MAXVALUE 100000; 
-- (SELECT �������̸�.NEXTVAL)
SELECT SQ_EMP.NEXTVAL FROM DUAL;
-- ���� ������ �� ����(SELECT �������̸�.CURRVAL) (����X)
SELECT SQ_EMP.CURRVAL FROM DUAL;

SELECT * FROM USER_SEQUENCES;

-- 2) �����ȣ�� �������κ��� �߱޹����ÿ�. 


-- �ӽ� ��� ���̺� : EMP01
--                 �÷��� : EMPNO NUMBER(4) PRIMARY KEY
--                         ENAME VARCHAR2(10),
--                         HIREDATE DATE
-- INSERT ���� �̿��ؼ� EMPNO�� ������ ���� �߰��Ͻÿ�.
-- ��, �̸��̳� ��¥�� ���Ƿ� ����
CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY,
         ENAME VARCHAR2(10),
         HIREDATE DATE );
         
INSERT INTO EMP01 VALUES(SQ_EMP.NEXTVAL, 'AAA',SYSDATE);

SELECT * FROM EMP01;

-- 3) EMP01 ���̺� �̸� �÷��� INDEX�� ����.(�ε����� : IDX_EMP01_ENAME)

CREATE INDEX IDX_EMP01_ENAME
ON EMP01(ENAME);






