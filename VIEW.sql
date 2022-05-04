-- 2022 05 04 뷰(VIEW) 실습
-- 뷰(VIEW) : 가상 테이블( 공간이 할당되어서 저장하고 있지 않음 )
-- 뷰에 저장된것 : SQL문 (SELECT문)
-- 비교) 테이블 : 공간이 할당되어 디스크에 저장되고 있음
-- 예)
-- 뷰 생성 권한 주기 (sys, system 계정만 가능함)
-- 문법 : GRANT 권한 TO 계정
grant create any view to scott;
-- 뷰 생성 권한 뺏기 (sys, system 계정만 가능함)
-- 문법 : REVOKE 권한 FROM 계정
revoke create any view from scott;
----------------------------------------------------------------
CREATE OR REPLACE VIEW VW_EMP_JOB
AS
SELECT ENO, ENAME, DNO, JOB
FROM EMPLOYEE
WHERE JOB LIKE 'SALES%';

SELECT * FROM VW_EMP_JOB;

-- 사원 테이블에는 급여정보가 포함되어 있습니다.(급여정보 : 비밀(대외비))
CREATE VIEW V_EMP_SAMPLE
AS 
SELECT ENO, ENAME, JOB, MANAGER, DNO
FROM EMPLOYEE;

-- 참고사항) 접속한 유저에 뷰 목록을 보고 싶을때 조회하는 딕셔너리
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS;

-- 그룹 함수를 쓴 SELECT 문을 뷰(VIEW)로 만들기
-- 수정을 위해 OR REPLACE 는 항상 붙히는게 좋다.
CREATE OR REPLACE VIEW VW_EMP_SALARY
AS
SELECT DNO, SUM(SALARY) AS "총액", TRUNC(AVG(SALARY)) AS 평균
FROM EMPLOYEE
GROUP BY DNO; -- 에러 (SELECT 문 그룹함수가 있는 컬럼에 별칭을 주어야함)

SELECT * FROM USER_VIEWS;
DROP VIEW VW_EMP_SALARY;

-- 연습문제 1) 뷰(VIEW) 실습
-- 1) 20번 부서에 소속된 사원의 사원번호와 이름과 부서번호를 출력하는 
--    VIEW를 정의.
CREATE OR REPLACE VIEW VW_EMP_SAMPLE
AS
SELECT DNO, ENAME 
FROM EMPLOYEE
WHERE DNO = 20;

SELECT * FROM USER_VIEWS;

-- 2) 이미 생성되어 있는 상기 뷰에 대해 급여 역시 출력 하도록 수정.
CREATE OR REPLACE VIEW VW_EMP_SAMPLE
AS
SELECT SALARY , DNO, ENAME 
FROM EMPLOYEE
WHERE DNO = 20;
SELECT * FROM VW_EMP_SAMPLE;







