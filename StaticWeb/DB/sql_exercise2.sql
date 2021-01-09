/**********************************************************
*   SQL Query & Function Example2
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
--Departments Table Columns
--DEPARTMENT_ID
--DEPARTMENT_NAME
--MANAGER_ID
--LOCATION_ID
**/

/**
50번 부서 월급의 평균ㅡ 최고, 최저, 인원수를 구하여 출력하라
**/
SELECT 
TRUNC(AVG(e.SALARY)) 평균,
max(e.SALARY) 최고,
min(e.SALARY) 최저,
count(*) 인원수
FROM EMPLOYEES e
WHERE DEPARTMENT_ID =50;


/**
각 부서별 급여의 평균, 최고, 최저, 인원수를 구하여 출력하라.
**/
SELECT 
e.DEPARTMENT_ID 부서번호, 
TRUNC(AVG(e.SALARY)) 평균,
max(e.SALARY) 최고,
min(e.SALARY) 최저,
count(*) 인원수
FROM EMPLOYEES e
GROUP BY e.DEPARTMENT_ID ;


/**
각 부서별 같은 업무를 하는 사람의 인원수를 구하여 부서번호, 업무명, 인원수를 출력하라.
**/
SELECT 
e.DEPARTMENT_ID 부서번호, 
e.JOB_ID 업무명,
count(*) 인원수
FROM EMPLOYEES e
GROUP BY e.DEPARTMENT_ID, e.JOB_ID;  -- 두가지 기준으로 그룹화 할때 ,(콤마) 사용


/**
같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 출력하라.
**/
SELECT 
e.JOB_ID 업무명,
count(*) 인원수
FROM EMPLOYEES e
GROUP BY e.JOB_ID
HAVING COUNT(e.JOB_ID) >= 4;


/**
각 부서별 평균월급, 전체월급, 최고월급, 최저월급,을 구하여 평균월급이 많은순으로 출력하라.
**/
SELECT 
e.DEPARTMENT_ID 부서번호,
Trunc(AVG(e.SALARY)) 평균월급,
SUM(e.SALARY) 전체월급,
MAX(e.SALARY) 최고월급,
MIN(e.SALARY) 최저월급 
FROM EMPLOYEES e
GROUP BY e.DEPARTMENT_ID ORDER BY 2 DESC;


/**
 부서번호, 부서명, 이름, 급여를 출력하라.
**/
SELECT 
e.DEPARTMENT_ID 부서번호,
d.DEPARTMENT_NAME 부서명,
e.FIRST_NAME 이름,
e.SALARY 급여
FROM EMPLOYEES e, DEPARTMENTS d;


/**
이름이 adam인 사원의 부서명을 출력하라.
**/
SELECT 
d.DEPARTMENT_NAME 부서명
FROM DEPARTMENTS d
WHERE d.DEPARTMENT_ID IN(
	SELECT e.DEPARTMENT_ID
	FROM EMPLOYEES e
	WHERE e.FIRST_NAME = 'Adam');  -- value 값은 대소문자 구분함

/**
employees테이블에 있는 employee_id와 manager_id를 이용하여 서로의 관계를 다음과 같이 출력하라
'smith'의 매니저는 'ford'이다.
**/
-- || :연결하는 기호
-- nvl 함수: NULL일때 대체하는 컬럼이나 문자 지정
SELECT 
e.FIRST_NAME || '의 매니저는' || nvl(e2.FIRST_NAME, '없') || '다.'
FROM EMPLOYEES e, EMPLOYEES e2 
WHERE e.MANAGER_ID = e2.EMPLOYEE_ID ;


/**
adam의 직무와 같은 직무를 갖는 사람의 이름, 부서명, 급여, 직무를 출력하라.
**/
SELECT 
e.FIRST_NAME 이름,
d.DEPARTMENT_NAME 부서이름,
e.SALARY 급여,
e.JOB_ID 직무
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.JOB_ID IN (
	SELECT e2.JOB_ID 
	FROM EMPLOYEES e2
	WHERE e2.FIRST_NAME = 'Adam');


/**
전체 사원의 평균 임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를 출력하라.
**/
SELECT 
e.EMPLOYEE_ID 사원번호,
e.FIRST_NAME 이름,
d.DEPARTMENT_NAME 부서이름,
e.HIRE_DATE 입사일,
d.LOCATION_ID 지역,
e.SALARY 급여
FROM EMPLOYEES e, DEPARTMENTS d
WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID 
AND e.SALARY > (SELECT AVG(e2.SALARY) FROM EMPLOYEES e2); -- 집계함수 where절에 쓰기위해서는 서브쿼리 이용


/**
50번 부서사람들 중에서 30번 부서의 사원과 같은 업무를 하는 사원의 사원번호, 이름, 부서명, 직무, 입사일을 출력하라.
**/
SELECT 
e.EMPLOYEE_ID 사원번호,
e.FIRST_NAME 이름,
d.DEPARTMENT_NAME 부서이름,
e.JOB_ID 직무,
e.HIRE_DATE 입사일
FROM EMPLOYEES e, DEPARTMENTS d
WHERE d.DEPARTMENT_ID =50
AND e.JOB_ID IN (
	SELECT e2.JOB_ID 
	FROM EMPLOYEES e2
	WHERE e2.DEPARTMENT_ID = 30) 



/**
급여가 30번 부서의 최고 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
**/
SELECT 
e.EMPLOYEE_ID 사원번호,
e.FIRST_NAME 이름,
e.SALARY 급여
FROM EMPLOYEES e
WHERE e.SALARY > (
	SELECT max(e2.SALARY)
	FROM EMPLOYEES e2
	WHERE e2.DEPARTMENT_ID = 30);