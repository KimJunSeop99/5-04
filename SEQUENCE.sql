-- SEQUENCE ���� (������)
-- �����Ҷ� Ű��(ID) : �ڵ� �����ϴ� ���� ���
-- SEQUENCE : DB���� �ڵ� �����ϴ� ���� ����� �� �� ����. (ä��)
-- ��) ���۰��� 10�̰� 1�� �����ϴ� ������ ����.(�̸� : SQ_EMP)
-- ���� ) CREATE SEQUENCE �������̸�
-- START WITH N : ������ ��ȣ�� ������ ����
-- INCREMENT BY N : N�� ����
-- MINVALUE N : N ������ �ּҰ�
-- MAXVALUE N : N ������ �ִ밪
CREATE SEQUENCE SQ_EMP 
INCREMENT BY 1 START WITH 10; 

SELECT * FROM USER_SEQUENCES;

-- ������ �׽�Ʈ (�����ϴ��� ���� �������� ���� O)
-- (SELECT �������̸�.NEXTVAL)
SELECT SQ_EMP.NEXTVAL FROM DUAL;
-- ���� ������ �� ����(SELECT �������̸�.CURRVAL) (����X)
SELECT SQ_EMP.CURRVAL FROM DUAL;

-- ���� ��)
-- �μ���ȣ�� ���� ������ ����
CREATE SEQUENCE SQ_DEPT
INCREMENT BY 1 START WITH 1;

-- �׽�Ʈ�� �� �μ����̺� ����
CREATE TABLE DEPT_COPY2
AS
SELECT * FROM DEPARTMENT
WHERE 1=0;

-- ������ �߰��ϱ� 
INSERT INTO DEPT_COPY2
VALUES(SQ_DEPT.NEXTVAL,'ACCOUNTING','NEW YORK');

SELECT * FROM DEPT_COPY2;

-- ������ �����ϱ�
DROP SEQUENCE SQ_DEPT;
DROP SEQUENCE SQ_EMP;




