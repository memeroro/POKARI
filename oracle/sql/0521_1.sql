-- 5/21 SQL 실습 1 : 함수, 그룹핑

-- 1. 직원의 풀네임(FIRST_NAME||' '||LAST_NAME)을 내림차순 정렬 조회
SELECT FIRST_NAME||' '||LAST_NAME AS FULLNAME
FROM EMPLOYEES
ORDER BY FULLNAME DESC;

-- 2. 직원 중에서 2005년 이후 입사자 수를 조회
SELECT COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE >= '2005-01-01'

-- 3. 모든 직원의 월급, 커미션, 월급+커미션을 월급+커미션이 많은 순으로 조회 (커미션이 NULL이 아닌 경우)
SELECT SALARY, COMMISSION_PCT*SALARY, SALARY+COMMISSION_PCT*SALARY AS SUM_SAL_COMM
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SUM_SAL_COMM DESC;

-- 4. MANAGER_ID가 149인 직원들의 직원아이디, 직원풀네임, 월급을 조회
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS FULLNAME, SALARY
FROM EMPLOYEES
WHERE MANAGER_ID = 149;

-- 5. FIRST_NAME이나 LAST_NAME이 5문자 이하인 직원의 정보를 조회
SELECT *
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME)<=5 OR LENGTH(LAST_NAME)<=5; 

-- 6. 짝수 년도에 고용된 직원들 중에서 COMMISSION_PCT가 있는 직원의 정보를 조회
SELECT *
FROM EMPLOYEES
WHERE
	COMMISSION_PCT IS NOT NULL
	AND
	MOD(TO_NUMBER(SUBSTR(TO_CHAR(HIRE_DATE),1, 2)), 2)=0;

-- 7. 월급이 10000이상이면 고소득자 10000미만 5000이상이면 일반소득자,
--       5000미만이면 저소득자로 직원의 정보를 조회
SELECT E.*,
	CASE 
		WHEN SALARY >= 10000 THEN '고소득자'
		WHEN SALARY >= 5000 AND SALARY < 10000 THEN '일반소득자'
		WHEN SALARY < 5000 THEN '저소득자'
	END
FROM EMPLOYEES E;

-- 8. 월급이 2000달러에서 3000달러 사이(양쪽 다 포함)인 직원의 정보를 월급 많은 순으로 조회
SELECT *
FROM EMPLOYEES
WHERE SALARY BETWEEN 2000 AND 3000
ORDER BY SALARY DESC;

-- 9. 매니저가 없는 부서의 부서명을 오름차순으로 조회
SELECT DEPARTMENT_NAME 
FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL
ORDER BY DEPARTMENT_NAME;

-- 10. 매니저의 아이디가 201	~205인 부서의 부서명을 오름차순 조회
SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE MANAGER_ID BETWEEN 201 AND 205
ORDER BY DEPARTMENT_NAME;
 
-- 11. 부서명에 'a'가 포함되는 부서의 정보를 조회
SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME LIKE '%a%';

-- 12. 부서명이 'P'로 시작하고 's'로 끝나는 부서의 정보를 조회
SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME LIKE 'P%s';

-- 13. 직원들의 JOB_ID를 12자리에 맞춰 오른쪽으로 정렬해서 조회
SELECT LPAD(JOB_ID, 12, ' ')
FROM EMPLOYEES;

-- 14. 직원들의 JOB_ID를 AC는 ACC로 ST는 STT로 변경해서 조회
SELECT REPLACE(REPLACE(JOB_ID, 'AC', 'ACC'), 'ST', 'STT')
FROM EMPLOYEES;

-- 15. 직원들의 근무개월수, 근무주수, 근무일수(주당 5일 근무)를 조회
SELECT 
	(TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(HIRE_DATE,'YYYY')) * 12 " 근무개월수",
	(TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(HIRE_DATE,'YYYY')) * 52 " 근무주수",
	(TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(HIRE_DATE,'YYYY')) * 52 * 5 " 근무일수"
FROM EMPLOYEES;

-- 16. 직원들의 직무시작일과 직무종료일을 '0000년 00월 00일 00시 00분 00초'로 조회
SELECT TO_CHAR(START_DATE, 'YYYY/MON/DAY'),
				TO_CHAR(END_DATE, 'YYYY/MON/DAY')
FROM JOB_HISTORY;

-- 17. 직원들의 직무시작일은 한달 전으로 직무종료일은 한달 후로 변경해 조회
SELECT START_DATE, ADD_MONTHS(START_DATE, -1), END_DATE, ADD_MONTHS(END_DATE, 1)
FROM JOB_HISTORY;

-- 18. 직원들의 직무종료일이 포함된 달의 마지막 일자를 조회
SELECT END_DATE, LAST_DAY(END_DATE)
FROM JOB_HISTORY;

-- 19. JOB_ID가  IT_PROG 또는 AC_ACCOUNT 또는 AC_MGR인 것에 대해
--       IT_PROG이면 "정보부", AC_ACCOUNT이면 "회계부", AC_MGR이면 "관리부"로 조회
SELECT  E.*,
	CASE
		WHEN JOB_ID = 'IT_PROG' THEN '정보부'
		WHEN JOB_ID = 'AC_ACCOUNT' THEN '회계부'
		WHEN JOB_ID = 'AC_MGR' THEN '관리부'
	END AS "부서"
FROM EMPLOYEES E
WHERE JOB_ID IN ('IT_PROG', 'AC_ACCOUNT','AC_MGR');

-- 20. 부서별로 부서아이디, 직원의 월급합계를 조회
SELECT DEPARTMENT_ID AS 부서아이디, SUM(SALARY) AS 직원월급합계
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID;


-- 21. 부서별로 부서아이디, 최대급여와 최소급여의 차를 조회
	SELECT DEPARTMENT_ID AS "부서 아이디", MAX(SALARY), MIN(SALARY),
		MAX(SALARY) - MIN(SALARY)  AS "급여 차"
	FROM EMPLOYEES
	GROUP BY DEPARTMENT_ID; 

-- 22. 부서별로 직원의 수가 5이상인 부서의 부서아이디, 직원수를 조회
SELECT DEPARTMENT_ID  AS "부서ID", COUNT(*) AS "직원수"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 5
ORDER BY 부서ID;





