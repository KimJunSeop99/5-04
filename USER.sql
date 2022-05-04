-- SCOTT 유저 권한 상승 : 롤 (ROLE : 여러 권한들을 모두 모아놨음)
-- CONNECT(접속에 관련된 권한모음집), RESOURCE(테이블, 뷰, 프로시져 생성, 권한)
-- DBA(유저, DB관리 등등 최상위 권한)
-- 권한 상승 시키는 롤
grant connect, resource, dba to scott;
-- 유저 생성 권한 부여
grant create user to scott;
-- 접속 : conn 유저ID/패스워드
-- 유저 만들기 (콘솔에서 생성)
CREATE USER  IDENTIFIED BY 1111
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- 권한 종류
-- CREATE TABLE : 테이블 생성 권한
-- CREATE VIEW : 뷰 생성 권한
-- CREATE SEQUENCE : 시퀀스 생성 권한 

-- 권한부여 명령어
-- GRANT 권한[롤] TO 유저명

-- 권한취소 명령어
-- REVOKE 권한[롤] FROM 유저명

-- 동의어 : 테이블 SELECT * FROM SCOTT.EMPLOYEE
-- 별칭으로 변경해서 이름을 정의해 줄 수 있음.

-- 연습문제 01) KBS라는 사용자를 생성하세요. 암호는 1234로 만드세요.
CREATE USER KBS IDENTIFIED BY 1234
-- DEFAULT TABLESPACE 명은 USERS 사용하고,
DEFAULT TABLESPACE USERS
-- TEMPORARY TABLESPACE TEMP 사용.
TEMPORARY TABLESPACE TEMP;

CREATE USER KBS IDENTIFIED BY 1234
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;