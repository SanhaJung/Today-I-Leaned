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

--�μ���ȣ�� 10���� �μ��� ��� �� �����ȣ, �̸�, ������ ����϶�
SELECT 
EMPLOYEE_ID �����ȣ, 
FIRST_NAME �̸�, 
e.SALARY ����
FROM EMPLOYEES
WHERE DEPARTMENT_ID = '10';




--�����ȣ�� 7369�� ��� �� �̸�, �Ի���, �μ� ��ȣ�� ����϶�.
SELECT
FIRST_NAME �̸�,
HIRE_DATE �Ի���,
DEPARTMENT_ID �μ���ȣ
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 109;



--�̸��� Ellen�� ����� ��� ������ ����϶�.
SELECT *
FROM EMPLOYEES 
WHERE FIRST_NAME = 'Ellen';




--�Ի����� 08/04/21�� ����� �̸�, �μ���ȣ, ������ ����϶�.
SELECT 
e.FIRST_NAME �̸�, 
e.DEPARTMENT_ID �μ���ȣ, 
e.SALARY ����
FROM EMPLOYEES e 
WHERE e.HIRE_DATE ='08/04/21';   -- ��¥ ��ȸ





--������ SA_MAN �ƴ� ����� ��� ������ ����϶�.
SELECT 
*
FROM EMPLOYEES e 
WHERE e.JOB_ID !='SA_MAN';



--�Ի����� 05/04/21 ���Ŀ� �Ի��� ����� ������ ����϶�.
SELECT 
*
FROM EMPLOYEES e 
WHERE e.HIRE_DATE > '05/04/21';


--�μ���ȣ 90,60���� ������ ��� ����� �̸�, �����ȣ, �μ���ȣ�� ����϶�.
SELECT 
e.FIRST_NAME �̸�, 
e.EMPLOYEE_ID �����ȣ, 
e.DEPARTMENT_ID �μ���ȣ
FROM EMPLOYEES e 
WHERE e.DEPARTMENT_ID != 90 AND e.DEPARTMENT_ID != 60;



--�̸��� S�� �����ϴ� ����� �����ȣ, �̸�, �Ի���, �μ���ȣ�� ����϶�.
SELECT 
e.EMPLOYEE_ID �����ȣ, 
e.FIRST_NAME �̸�, 
e.HIRE_DATE �Ի���, 
e.DEPARTMENT_ID �μ���ȣ
FROM EMPLOYEES e 
WHERE e.FIRST_NAME LIKE 'S%';  -- ���ڰ˻��� LIKE


--�̸��� s�� �����ϰ� ������ ���ڰ� l�� ����� ������ ����϶�.
SELECT 
*
FROM EMPLOYEES e 
WHERE  e.FIRST_NAME LIKE 'S%' AND e.FIRST_NAME LIKE '%l';



/**
employees ���̺��� �̸�, �޿�, ��, �Ѿ��� ���Ͽ� �Ѿ� ���� ������ ����϶� �� �󿩱��� NULL�� ����� ����
*/
SELECT 
e.FIRST_NAME �̸�,
e.SALARY �޿�,
e.SALARY*NVL(e.COMMISSION_PCT, 0) �󿩱�,
e.SALARY+e.SALARY*NVL(e.COMMISSION_PCT, 0) �Ѿ�     -- NVL�Լ�
FROM EMPLOYEES e 
WHERE  e.COMMISSION_PCT IS NOT NULL 
ORDER BY �Ѿ� DESC;

-- NVL�Լ�(�÷���, �ٲ� ������)
-- �ش��÷��� Null�� ������ ��õ� ������ �ٲ��ִ� ����
-- Null�� ������� ���� �� ����


/**
10�� �μ��� ��� ����鿡�� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���. �̸�, �޿�, ���ʽ��ݾ�, �μ���ȣ�� ����϶�.
**/



/**
30�� �μ��� ������ ����Ͽ� �̸�, �μ���ȣ, �޿�, ������ ����϶�. �� ������ �޿��� 150%�� ���ʽ��� �����Ѵ�.
   -- ���� = sal*12+(sal*1.5)
**/




/**
�μ���ȣ�� 20�� �μ��� �ð��� �ӱ��� ����Ͽ� ����϶�. �� 1���� �ٹ��ϼ��� 12���̰� 1�� �ٹ��ð��� 5�ð��̴�.
��¾���� �̸�, �޿�, �ð��� �ӱ�(�Ҽ����� 1��° �ڸ����� �ݿø�)�� ����϶�.
   -- �ñ� = sal/�ϼ�/�ð�  -> sal/ 12/5 
   -- round(m, n) m�� �Ҽ��� n�ڸ����� �ݿø� 
**/




/**
�޿��� 1500���� 3000������ ����� �޿��� 5%�� ȸ��� �����ϱ�� �Ͽ���. �̸� �̸�, �޿�, ȸ��(-2�ڸ����� �ݿø�)�� ����϶�.
	-- ȸ��  = sal * 0.05	
	-- -2�ڸ����� �ݿø� : ���� 2��° �ڸ����� �ݿø�.. 100������  
**/





/**
�Ի��Ϻ��� ���ݱ����� ��¥���� ����϶�. �μ���ȣ, �̸�, �Ի���, ������, �ٹ��ϼ�(�Ҽ�����������), �ٹ����,
 �ٹ�����(30�� ����)�� ����϶�.
	-- ���� ��¥ : sysdate 
	-- �ٹ� �ϼ� : ���糯¥ - �Ի��� = sysdate - hire_date  -> ��¥ - ��¥ : �ϼ� ����
	-- �ٹ� ��� : to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY')
	-- �ٹ� ���� : �ٹ��ϼ� / 1��(30��)
**/







/**
�Ի��Ϸκ��� ���ñ����� �ϼ��� ���Ͽ� �̸�, �Ի���, �ٹ��ϼ��� ����϶�.
--round(sysdate-hiredate,0) �ٹ��ϼ�
**/



/**
�Ի����� 2012�� 7�� 5���� ���·� �̸�, �Ի����� ����϶�.
	-- ��¥ ���� �տ� fm �� ���� '0'�� ǥ������ �ʴ´ٴ� ��.. 
	-- 'fmYYYY"��" MM"��" DD"��' 
**/




/**
�̸�(first_name)�� ���ڼ��� 6���̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� �̸����� ����϶�.
	-- substr(str, position, length) : str ���ڸ� positin ���� length���� ��ŭ ǥ��
	-- lower(str)  �ҹ��� ��ȯ
	-- length(str)  str�� ����
**/






/**
10�� �μ� ������ ��դ� �ְ�, ����, �ο����� ���Ͽ� ����϶�
**/





/**
�� �μ��� �޿��� ���, �ְ�, ����, �ο����� ���Ͽ� ����϶�.
**/






/**
�� �μ��� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ, ������, �ο����� ����϶�.
**/





/**
���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο����� ����϶�.
**/





/**
�� �μ��� ��տ���, ��ü����, �ְ����, ��������,�� ���Ͽ� ��տ����� ���������� ����϶�.
**/




