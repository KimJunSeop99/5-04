-- SCOTT ���� ���� ��� : �� (ROLE : ���� ���ѵ��� ��� ��Ƴ���)
-- CONNECT(���ӿ� ���õ� ���Ѹ�����), RESOURCE(���̺�, ��, ���ν��� ����, ����)
-- DBA(����, DB���� ��� �ֻ��� ����)
-- ���� ��� ��Ű�� ��
grant connect, resource, dba to scott;
-- ���� ���� ���� �ο�
grant create user to scott;
-- ���� : conn ����ID/�н�����
-- ���� ����� (�ֿܼ��� ����)
CREATE USER  IDENTIFIED BY 1111
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- ���� ����
-- CREATE TABLE : ���̺� ���� ����
-- CREATE VIEW : �� ���� ����
-- CREATE SEQUENCE : ������ ���� ���� 

-- ���Ѻο� ��ɾ�
-- GRANT ����[��] TO ������

-- ������� ��ɾ�
-- REVOKE ����[��] FROM ������

-- ���Ǿ� : ���̺� SELECT * FROM SCOTT.EMPLOYEE
-- ��Ī���� �����ؼ� �̸��� ������ �� �� ����.

-- �������� 01) KBS��� ����ڸ� �����ϼ���. ��ȣ�� 1234�� ���弼��.
CREATE USER KBS IDENTIFIED BY 1234
-- DEFAULT TABLESPACE ���� USERS ����ϰ�,
DEFAULT TABLESPACE USERS
-- TEMPORARY TABLESPACE TEMP ���.
TEMPORARY TABLESPACE TEMP;

CREATE USER KBS IDENTIFIED BY 1234
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;