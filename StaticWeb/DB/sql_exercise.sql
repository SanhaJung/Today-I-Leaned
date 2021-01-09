/**********************************************************
*   SQL Query & Function Example1(hr계정 사용)
**********************************************************/
/**
-- Employees Table Columns
-- EMPLOYEE_ID
-- FIRST_NAME
-- LAST_NAME
-- EMAIL
-- PHONE_NUMBER
-- HIRE_DATE
-- JOB_ID
-- SALARY
-- COMMISSION_PCT
-- MANAGER_ID
-- DEPARTMENT_ID
**/
/**
DEPARTMENTS
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPARTMENT_ID                             NOT NULL NUMBER(4)
 DEPARTMENT_NAME                           NOT NULL VARCHAR2(30)
 MANAGER_ID                                         NUMBER(6)
 LOCATION_ID                                        NUMBER(4)

EMPLOYEES
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                               NOT NULL NUMBER(6)
 FIRST_NAME                                         VARCHAR2(20)
 LAST_NAME                                 NOT NULL VARCHAR2(25)
 EMAIL                                     NOT NULL VARCHAR2(25)
 PHONE_NUMBER                                       VARCHAR2(20)
 HIRE_DATE                                 NOT NULL DATE
 JOB_ID                                    NOT NULL VARCHAR2(10)
 SALARY                                             NUMBER(8,2)
 COMMISSION_PCT                                     NUMBER(2,2)
 MANAGER_ID                                         NUMBER(6)
 DEPARTMENT_ID                                      NUMBER(4)
**/

--부서번호가 10번인 부서의 사람 중 사원번호, 이름, 월급을 출력하라
SELECT 
EMPLOYEE_ID 사원번호, 
FIRST_NAME 이름, 
e.SALARY 월급
FROM EMPLOYEES
WHERE DEPARTMENT_ID = '10';


--사원번호가 7369인 사람 중 이름, 입사일, 부서 번호를 출력하라.
SELECT
FIRST_NAME 이름,
HIRE_DATE 입사일,
DEPARTMENT_ID 부서번호
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 109;


--이름이 Ellen인 사람의 모든 정보를 출력하라.
SELECT *
FROM EMPLOYEES 
WHERE FIRST_NAME = 'Ellen';


--입사일이 08/04/21인 사원의 이름, 부서번호, 월급을 출력하라.
SELECT 
e.FIRST_NAME 이름, 
e.DEPARTMENT_ID 부서번호, 
e.SALARY 월급
FROM EMPLOYEES e 
WHERE e.HIRE_DATE ='08/04/21';   -- 날짜 조회


--직무가 SA_MAN 아닌 사람의 모든 정보를 출력하라.
SELECT 
*
FROM EMPLOYEES e 
WHERE e.JOB_ID !='SA_MAN';


--입사일이 05/04/21 이후에 입사한 사원의 정보를 출력하라.
SELECT 
*
FROM EMPLOYEES e 
WHERE e.HIRE_DATE > '05/04/21';


--부서번호 90,60번을 제외한 모든 사람의 이름, 사원번호, 부서번호를 출력하라.
SELECT 
e.FIRST_NAME 이름, 
e.EMPLOYEE_ID 사원번호, 
e.DEPARTMENT_ID 부서번호
FROM EMPLOYEES e 
WHERE e.DEPARTMENT_ID != 90 AND e.DEPARTMENT_ID != 60;


--이름이 S로 시작하는 사원의 사원번호, 이름, 입사일, 부서번호를 출력하라.
SELECT 
e.EMPLOYEE_ID 사원번호, 
e.FIRST_NAME 이름, 
e.HIRE_DATE 입사일, 
e.DEPARTMENT_ID 부서번호
FROM EMPLOYEES e 
WHERE e.FIRST_NAME LIKE 'S%';  -- 문자검색은 LIKE


--이름이 s로 시작하고 마지막 글자가 l인 사람이 정보를 출력하라.
SELECT 
*
FROM EMPLOYEES e 
WHERE  e.FIRST_NAME LIKE 'S%' AND e.FIRST_NAME LIKE '%l';


/**
employees 테이블에서 이름, 급여, 상여, 총액을 구하여 총액 많은 순서로 출력하라 단 상여금이 NULL인 사람은 제외
*/
SELECT 
e.FIRST_NAME 이름,
e.SALARY 급여,
e.SALARY*NVL(e.COMMISSION_PCT, 0) 상여금,
e.SALARY*12+e.SALARY*NVL(e.COMMISSION_PCT, 0) 총액     -- NVL함수
FROM EMPLOYEES e 
WHERE  e.COMMISSION_PCT IS NOT NULL 
ORDER BY 총액 DESC;

-- NVL함수(컬럼명, 바꿀 데이터)
-- 해당컬럼에 Null이 있을때 명시된 값으로 바꿔주는 역할
-- Null을 고려하지 않을 때 사용됨


/**
60번 부서의 모든 사람들에게 급여의 13%를 보너스로 지불하기로 하였다. 이름, 급여, 보너스금액, 부서번호를 출력하라.
**/
-- TODO: 60번 부서만 보너스주고 전체 출력하는 쿼리문 써보기
SELECT 
e.FIRST_NAME 이름,
e.SALARY 급여,
(e.SALARY*0.13) "보너스 금액",
e.DEPARTMENT_ID 부서번호
FROM EMPLOYEES e 
WHERE  e.DEPARTMENT_ID = 60;


/**
30번 부서의 연봉을 계산하여 이름, 부서번호, 급여, 연봉을 출력하라. 단 연말에 급여의 150%를 보너스로 지급한다.
   -- 연봉 = sal*12+(sal*1.5)
**/
SELECT 
e.FIRST_NAME 이름, 
e.DEPARTMENT_ID 부서번호, 
e.SALARY 급여, 
e.SALARY*12+e.SALARY*1.5 연봉
FROM EMPLOYEES e;


/**
부서번호가 50인 부서의 시간당 임금을 계산하여 출력하라. 단 1달의 근무일수는 12일이고 1일 근무시간은 5시간이다.
출력양식은 이름, 급여, 시간당 임금(소수이하 1번째 자리에서 반올림)을 출력하라.
   -- 시급 = sal/일수/시간  -> sal/ 12/5 
   -- round(m, n) m을 소수점 n자리에서 반올림 
**/
SELECT 
e.FIRST_NAME 이름,
e.SALARY 급여, 
ROUND(e.SALARY /(12*5), 1) 시간당임금
FROM EMPLOYEES e 
WHERE e.DEPARTMENT_ID = 50;


/**
급여가 1500부터 3000사이의 사람은 급여의 5%를 회비로 지불하기로 하였다. 이를 이름, 급여, 회비(-2자리에서 반올림)를 출력하라.
   -- 회비  = sal * 0.05   
   -- -2자리에서 반올림 : 정수 2번째 자리에서 반올림.. 100단위로  
**/
SELECT 
e.FIRST_NAME 이름,
e.SALARY 급여, 
ROUND(e.SALARY*0.05, -2) 회비    -- round(m, n) n이 음수일때 정수자릿수에서 반올림
FROM EMPLOYEES e 
WHERE e.SALARY  BETWEEN  1500 AND 3000;   -- BETWEEN 사이에 수 구할때 


/**
입사일부터 지금까지의 날짜수를 출력하라. 부서번호, 이름, 입사일, 현재일, 근무일수(소수점이하절삭), 근무년수,
 근무월수(30일 기준)를 출력하라.
   -- 지금 날짜 : sysdate 
   -- 근무 일수 : 현재날짜 - 입사일 = sysdate - hire_date  -> 날짜 - 날짜 : 일수 나옴
   -- 근무 년수 : to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY')
   -- 근무 월수 : 근무일수 / 1달(30일)
**/
-- TO_CHAR함수 : 문자 형식 변경
--              날짜 포맷 변경, 소수점길이 변경, 숫자 천단위 콤마, 지정한 길이로 0 채우기...
SELECT 
e.DEPARTMENT_ID 부서번호, 
e.FIRST_NAME 이름, 
TO_CHAR(SYSDATE, 'YYYY-MM-DD') 현재일, 
ROUND(SYSDATE -e.HIRE_DATE, 1) 근무일수,
TO_CHAR(SYSDATE, 'YYYY')-TO_CHAR(e.HIRE_DATE, 'YYYY')  근무년수, 
ROUND(ROUND(SYSDATE -e.HIRE_DATE, 1)/30, 0)  근무월수
FROM EMPLOYEES e;


/**
입사일로부터 오늘까지의 일수를 구하여 이름, 입사일, 근무일수를 출력하라.
--round(sysdate-hiredate,0) 근무일수
**/
SELECT 
e.FIRST_NAME 이름, 
TO_CHAR(e.HIRE_DATE , 'YYYY-MM-DD') 입사일,
ROUND(SYSDATE -e.HIRE_DATE, 0) 근무일수
FROM EMPLOYEES e;


/**
입사일을 2012년 7월 5일의 형태로 이름, 입사일을 출력하라.
   -- 날짜 형시 앞에 fm 은 선행 '0'을 표현하지 않는다는 뜻.. 
   -- 'fmYYYY"년" MM"월" DD"일'    - ", '구분 잘해야함 - 바깥: ', 안쪽 "
**/
SELECT 
e.FIRST_NAME 이름, 
TO_CHAR(e.HIRE_DATE , 'fmYYYY"년" MM"월" DD"일"') 입사일
FROM EMPLOYEES e;



/**
이름(first_name)의 글자수가 6자이상인 사람의 이름을 앞에서 3자만 구하여 소문자로 이름만을 출력하라.
   -- substr(str, position, length) : str 문자를 positin(문자열 첫자가 1부터 시작) 부터 length길이 만큼 표현
   -- lower(str)  소문자 변환
   -- length(str)  str의 길이
**/
SELECT 
LOWER(SUBSTR(e.FIRST_NAME, 1, 3)) 이름
FROM EMPLOYEES e
WHERE length(e.FIRST_NAME) >= 6;


/**
80번 부서 월급의 평균ㅡ 최고, 최저, 인원수를 구하여 출력하라
**/
--TRUNC함수: 소수점 절사및 날짜 시간 없앨때
SELECT 
TRUNC(AVG(e.SALARY)) 평균,
max(e.SALARY) 최고, 
min(e.SALARY) 최저,
COUNT(*) 
FROM EMPLOYEES e
WHERE e.DEPARTMENT_ID  = 80;


/**
각 부서별 급여의 평균, 최고, 최저, 인원수를 구하여 출력하라.
**/
SELECT 
e.DEPARTMENT_ID 부서번호, 
TRUNC(avg(e.SALARY)) 평균, 
max(e.SALARY) 최고, 
min(e.SALARY) 최저,
COUNT(*) 인원수
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID ORDER BY 1;   -- ORDER BY 1: 1번 컬럼을 기준으로 오름차순 정렬
                --                    내림차순은 ORDER BY 1 DESC





/**
각 부서별 같은 업무를 하는 사람의 인원수를 구하여 부서번호, 업무명, 인원수를 출력하라.
**/
SELECT 
e.DEPARTMENT_ID  부서번호, 
e.JOB_ID 업무명, 
COUNT(*)  인원수
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID,e.JOB_ID ; -- 중복해서 그룹 조건은 쉼표로


/**
같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 출력하라.
**/
-- HAVING 절
-- 집계함수로 조건 비교(WHERE절은 집계함 수 사용X)
-- GROUP BY절과 함께 사용
SELECT 
e.JOB_ID 업무명, 
COUNT(*)  인원수
FROM EMPLOYEES e 
GROUP BY e.JOB_ID 
HAVING COUNT(e.JOB_ID) >= 4;



/**
각 부서별 평균월급, 전체월급, 최고월급, 최저월급,을 구하여 평균월급이 많은순으로 출력하라.
**/
SELECT 
e.DEPARTMENT_ID 부서번호,
TRUNC(AVG(e.SALARY)) 평균월급, 
sum(e.SALARY) 전체월급, 
max(e.SALARY) 최고월급, 
min(e.SALARY) 최저월급
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID ORDER BY 2 DESC;           -- 2번째 컬럼 기준으로 내림차순


