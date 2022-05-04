-- 2022 05 04 ��(VIEW) �ǽ�
-- ��(VIEW) : ���� ���̺�( ������ �Ҵ�Ǿ �����ϰ� ���� ���� )
-- �信 ����Ȱ� : SQL�� (SELECT��)
-- ��) ���̺� : ������ �Ҵ�Ǿ� ��ũ�� ����ǰ� ����
-- ��)
-- �� ���� ���� �ֱ� (sys, system ������ ������)
-- ���� : GRANT ���� TO ����
grant create any view to scott;
-- �� ���� ���� ���� (sys, system ������ ������)
-- ���� : REVOKE ���� FROM ����
revoke create any view from scott;
----------------------------------------------------------------
CREATE OR REPLACE VIEW VW_EMP_JOB
AS
SELECT ENO, ENAME, DNO, JOB
FROM EMPLOYEE
WHERE JOB LIKE 'SALES%';

SELECT * FROM VW_EMP_JOB;

-- ��� ���̺��� �޿������� ���ԵǾ� �ֽ��ϴ�.(�޿����� : ���(��ܺ�))
CREATE VIEW V_EMP_SAMPLE
AS 
SELECT ENO, ENAME, JOB, MANAGER, DNO
FROM EMPLOYEE;

-- �������) ������ ������ �� ����� ���� ������ ��ȸ�ϴ� ��ųʸ�
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS;

-- �׷� �Լ��� �� SELECT ���� ��(VIEW)�� �����
-- ������ ���� OR REPLACE �� �׻� �����°� ����.
CREATE OR REPLACE VIEW VW_EMP_SALARY
AS
SELECT DNO, SUM(SALARY) AS "�Ѿ�", TRUNC(AVG(SALARY)) AS ���
FROM EMPLOYEE
GROUP BY DNO; -- ���� (SELECT �� �׷��Լ��� �ִ� �÷��� ��Ī�� �־����)

SELECT * FROM USER_VIEWS;
DROP VIEW VW_EMP_SALARY;

-- �������� 1) ��(VIEW) �ǽ�
-- 1) 20�� �μ��� �Ҽӵ� ����� �����ȣ�� �̸��� �μ���ȣ�� ����ϴ� 
--    VIEW�� ����.
CREATE OR REPLACE VIEW VW_EMP_SAMPLE
AS
SELECT DNO, ENAME 
FROM EMPLOYEE
WHERE DNO = 20;

SELECT * FROM USER_VIEWS;

-- 2) �̹� �����Ǿ� �ִ� ��� �信 ���� �޿� ���� ��� �ϵ��� ����.
CREATE OR REPLACE VIEW VW_EMP_SAMPLE
AS
SELECT SALARY , DNO, ENAME 
FROM EMPLOYEE
WHERE DNO = 20;
SELECT * FROM VW_EMP_SAMPLE;







