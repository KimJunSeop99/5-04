-- 2022 05 04 INDEX 생성(*****)
-- 대상 컬럼에 생성을 함
-- 인덱스 목적 : 조회 (SELECT) 성능을 높이기 위해서 인덱스를 생성
-- 인덱스 알고리즘 : B* TREE (검색 속도 향상 알고리즘)
-- 예 )
-- 문법 : CREATE INDEX 인덱스이름 ON 테이블명(컬럼명);
-- 인덱스를 걸어야 하는 컬럼
-- 1) 테이블에 행의 수가 너무 많을때 : EX)10만건 이상
-- 2) WHERE절에 대상 컬럼이 너무 자주 나올때
-- 3) 검색 결과가 전체의 대략 2%~5%정도 나올때 (반대로 10%이상 인덱스 걸면 더 안좋음)
-- 4) 조인에 사용되는 컬럼은 인덱스를 거는것을 고려 ......
CREATE INDEX IDX_EMPLOYEE_ENAME
ON EMPLOYEE(ENAME);

-- 인덱스 생성 확인(인덱스 전용 딕셔너리)
SELECT * FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEE';

-- 인덱스 삭제
DROP INDEX IDX_EMPLOYEE_ENAME;

-- 결합 인덱스
CREATE INDEX IDX_DEPT_COM
-- 인덱스는 1개 컬럼은 2개
ON DEPARTMENT(DNAME, LOC);

-- 특수) 함수 기반 인덱스 : 수식이나 함수를 적용해서 만든 인덱스
CREATE INDEX IDX_EMP_ANNSAL
ON EMPLOYEE(SALARY*12);

-- 연습문제 1) : 시퀀스 & 인덱스 실습
-- 1) 사원 테이블의 사원번호가 자동으로 생성되도록 시퀀스 생성.
-- 시퀀스 이름 : SQ_EMP , 시작번호 : 1, 증가 : 1, 최대값 : 100000
CREATE SEQUENCE SQ_EMP 
INCREMENT BY 1 START WITH 1 MAXVALUE 100000; 
-- (SELECT 시퀀스이름.NEXTVAL)
SELECT SQ_EMP.NEXTVAL FROM DUAL;
-- 현재 시퀀스 값 보기(SELECT 시퀀스이름.CURRVAL) (증가X)
SELECT SQ_EMP.CURRVAL FROM DUAL;

SELECT * FROM USER_SEQUENCES;

-- 2) 사원번호를 시퀀스로부터 발급받으시오. 


-- 임시 사원 테이블 : EMP01
--                 컬럼명 : EMPNO NUMBER(4) PRIMARY KEY
--                         ENAME VARCHAR2(10),
--                         HIREDATE DATE
-- INSERT 문을 이용해서 EMPNO에 시퀀스 값을 추가하시오.
-- 단, 이름이나 날짜는 임의로 설정
CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY,
         ENAME VARCHAR2(10),
         HIREDATE DATE );
         
INSERT INTO EMP01 VALUES(SQ_EMP.NEXTVAL, 'AAA',SYSDATE);

SELECT * FROM EMP01;

-- 3) EMP01 테이블에 이름 컬럼에 INDEX를 생성.(인덱스명 : IDX_EMP01_ENAME)

CREATE INDEX IDX_EMP01_ENAME
ON EMP01(ENAME);






