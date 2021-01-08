/**********************************************************
*	SQL Query & Function Example1
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
e.SALARY+e.SALARY*NVL(e.COMMISSION_PCT, 0) 총액     -- NVL함수
FROM EMPLOYEES e 
WHERE  e.COMMISSION_PCT IS NOT NULL 
ORDER BY 총액 DESC;

-- NVL함수(컬럼명, 바꿀 데이터)
-- 해당컬럼에 Null이 있을때 명시된 값으로 바꿔주는 역할
-- Null을 고려하지 않을 때 사용됨


/**
10번 부서의 모든 사람들에게 급여의 13%를 보너스로 지불하기로 하였다. 이름, 급여, 보너스금액, 부서번호를 출력하라.
**/



/**
30번 부서의 연봉을 계산하여 이름, 부서번호, 급여, 연봉을 출력하라. 단 연말에 급여의 150%를 보너스로 지급한다.
   -- 연봉 = sal*12+(sal*1.5)
**/




/**
부서번호가 20인 부서의 시간당 임금을 계산하여 출력하라. 단 1달의 근무일수는 12일이고 1일 근무시간은 5시간이다.
출력양식은 이름, 급여, 시간당 임금(소수이하 1번째 자리에서 반올림)을 출력하라.
   -- 시급 = sal/일수/시간  -> sal/ 12/5 
   -- round(m, n) m을 소수점 n자리에서 반올림 
**/




/**
급여가 1500부터 3000사이의 사람은 급여의 5%를 회비로 지불하기로 하였다. 이를 이름, 급여, 회비(-2자리에서 반올림)를 출력하라.
	-- 회비  = sal * 0.05	
	-- -2자리에서 반올림 : 정수 2번째 자리에서 반올림.. 100단위로  
**/





/**
입사일부터 지금까지의 날짜수를 출력하라. 부서번호, 이름, 입사일, 현재일, 근무일수(소수점이하절삭), 근무년수,
 근무월수(30일 기준)를 출력하라.
	-- 지금 날짜 : sysdate 
	-- 근무 일수 : 현재날짜 - 입사일 = sysdate - hire_date  -> 날짜 - 날짜 : 일수 나옴
	-- 근무 년수 : to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY')
	-- 근무 월수 : 근무일수 / 1달(30일)
**/







/**
입사일로부터 오늘까지의 일수를 구하여 이름, 입사일, 근무일수를 출력하라.
--round(sysdate-hiredate,0) 근무일수
**/



/**
입사일을 2012년 7월 5일의 형태로 이름, 입사일을 출력하라.
	-- 날짜 형시 앞에 fm 은 선행 '0'을 표현하지 않는다는 뜻.. 
	-- 'fmYYYY"년" MM"월" DD"일' 
**/




/**
이름(first_name)의 글자수가 6자이상인 사람의 이름을 앞에서 3자만 구하여 소문자로 이름만을 출력하라.
	-- substr(str, position, length) : str 문자를 positin 부터 length길이 만큼 표현
	-- lower(str)  소문자 변환
	-- length(str)  str의 길이
**/






/**
10번 부서 월급의 평균ㅡ 최고, 최저, 인원수를 구하여 출력하라
**/





/**
각 부서별 급여의 평균, 최고, 최저, 인원수를 구하여 출력하라.
**/






/**
각 부서별 같은 업무를 하는 사람의 인원수를 구하여 부서번호, 업무명, 인원수를 출력하라.
**/





/**
같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 출력하라.
**/





/**
각 부서별 평균월급, 전체월급, 최고월급, 최저월급,을 구하여 평균월급이 많은순으로 출력하라.
**/




