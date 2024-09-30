-- Join / Subquery 1

-- * 풀네임 : FIRST_NAME||' '||LAST_NAME

-- 1. 직원의 풀네임과 부서명을 조회

-- ORACLE 문법
SELECT E.FIRST_NAME||' '||E.LAST_NAME "풀네임", D.DEPARTMENT_NAME "부서명"
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- ANSI(SQL99) 문법
SELECT E.FIRST_NAME||' '||E.LAST_NAME "풀네임", D.DEPARTMENT_NAME "부서명"
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 2. 각 직원의 풀네임, 직무ID, 직무명, 직무별 최대급여와 최저급여의 차이를 조회
SELECT E.FIRST_NAME||' '||E.LAST_NAME "풀네임", J.JOB_ID "직무ID"
	, J.JOB_TITLE "직무명", J.MAX_SALARY-J.MIN_SALARY "최대최저급여차"
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
WHERE
	E.DEPARTMENT_ID = D.DEPARTMENT_ID
	AND 
	E.JOB_ID = J.JOB_ID;

-- 3. 2006년에 일을 한 직원의 풀네임과 작업시작일, 작업종료일을 조회
SELECT E.FIRST_NAME||' '||E.LAST_NAME "풀네임"
	, JH.START_DATE "작업시작일", JH.END_DATE "작업종료일"
FROM EMPLOYEES E, JOB_HISTORY JH
WHERE 
	E.EMPLOYEE_ID = JH.EMPLOYEE_ID
	AND
	JH.END_DATE >= '2006-01-01';

-- 4. 풀네임이 D로 시작하는 직원 중 JOB_ID가 IT_PROG인 직원들의
--     직원아이디, 풀네임, 직업명을 조회
SELECT E.EMPLOYEE_ID "직원아이디", E.FIRST_NAME||' '||E.LAST_NAME "풀네임"
	, J.JOB_TITLE "직업명"
FROM EMPLOYEES E, JOBS J
WHERE
	E.JOB_ID = J.JOB_ID
	AND 
	E.FIRST_NAME||' '||E.LAST_NAME LIKE 'D%'
	AND
	J.JOB_ID = 'IT_PROG';

-- 5. 직원 중 부서아이디가 20 또는 50인 직원들의 아이디와 풀네임, 부서아이디, 부서명을 조회
SELECT E.EMPLOYEE_ID "직원아이디", E.FIRST_NAME||' '||E.LAST_NAME "풀네임"
	, D.DEPARTMENT_ID "부서아이디", D.DEPARTMENT_NAME "부서명"
FROM EMPLOYEES E, DEPARTMENTS D
WHERE
	E.DEPARTMENT_ID = D.DEPARTMENT_ID 
	AND 
	D.DEPARTMENT_ID IN (20, 50);

-- 6. 직원 중 부서아이디가 3의 배수인 직원들의 아이디, 풀네임, 부서아이디, 부서명을 조회
SELECT E.EMPLOYEE_ID "직원아이디", E.FIRST_NAME||' '||E.LAST_NAME "풀네임"
	, D.DEPARTMENT_ID "부서아이디", D.DEPARTMENT_NAME "부서명"
FROM EMPLOYEES E, DEPARTMENTS D
WHERE
	E.DEPARTMENT_ID = D.DEPARTMENT_ID 
	AND 
	MOD(D.DEPARTMENT_ID, 3) = 0;

-- 7. 직원아이디가 100인 직원과 같은 부서에 근무하는 직원들의
--     직원아이디, 풀네임, 부서아이디, 부서명을 조회
SELECT E.EMPLOYEE_ID "직원아이디", E.FIRST_NAME||' '||E.LAST_NAME "풀네임"
	, D.DEPARTMENT_ID "부서아이디", D.DEPARTMENT_NAME "부서명"
FROM EMPLOYEES E, DEPARTMENTS D
WHERE
	E.DEPARTMENT_ID = D.DEPARTMENT_ID 
	AND
	E.DEPARTMENT_ID 
		= (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE EMPLOYEE_ID=100);

-- 8. 부서명이 M으로 시작하는 부서에 근무하는 직원들의
--     직원아이디, 풀네임, 부서아이디, 부서명을 조회
SELECT E.EMPLOYEE_ID "직원아이디", E.FIRST_NAME||' '||E.LAST_NAME "풀네임"
	, D.DEPARTMENT_ID "부서아이디", D.DEPARTMENT_NAME "부서명"
FROM EMPLOYEES E, DEPARTMENTS D
WHERE
	E.DEPARTMENT_ID = D.DEPARTMENT_ID 
	AND
	D.DEPARTMENT_NAME LIKE 'M%';	

-- 9. 직무아이디가 IT_PROG인 직원들 중 최소월급을 받는 사람과
--       최대월급을 받는 사람의 직원아이디, 풀네임, 부서명, 월급을 조회
-- ORACLE
SELECT E.EMPLOYEE_ID "직원아이디", E.FIRST_NAME||' '||E.LAST_NAME "풀네임"
	,D.DEPARTMENT_NAME "부서명", E.SALARY "월급"
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
WHERE
	E.DEPARTMENT_ID = D.DEPARTMENT_ID 
	AND
	E.JOB_ID = J.JOB_ID 
	AND
	E.JOB_ID = 'IT_PROG'
	AND
	(
		E.SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG')
		OR
		E.SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG')
	);

-- ANSI
SELECT E.EMPLOYEE_ID "직원아이디", E.FIRST_NAME||' '||E.LAST_NAME "풀네임"
	,D.DEPARTMENT_NAME "부서명", E.SALARY "월급"
FROM EMPLOYEES E 
	JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
	JOIN JOBS J ON E.JOB_ID = J.JOB_ID
WHERE
	E.JOB_ID = 'IT_PROG'
	AND
	(
		E.SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG')
		OR
		E.SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG')
	);

-- 10. 모든 직원의 직원아이디, 풀네임, 부서명, 커미션이 포함된 월급을 조회
--       (단, 커미션퍼센트가 NULL인 경우는 제외, 커미션은 월급*커미션포인트)
SELECT E.EMPLOYEE_ID "직원아이디", E.FIRST_NAME||' '||E.LAST_NAME "풀네임"
	,D.DEPARTMENT_NAME "부서명", E.SALARY + E.SALARY * NVL(E.COMMISSION_PCT, 0) "커미션포함월급"
FROM EMPLOYEES E, DEPARTMENTS D
WHERE
	E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 11. 커미션퍼센트가 NULL인 직원들이 근무하는 부서별로
--      부서아이디, 부서명, 부서직원들의 커미션이 포함된 월급의 합계를 조회
--      (단, 커미션퍼센트가 NULL인 경우는 0으로 처리, 커미션은 월급*커미션포인트)
SELECT D.DEPARTMENT_ID "부서아이디", D.DEPARTMENT_NAME "부서명"
	, SUM(E.SALARY + E.SALARY * NVL(E.COMMISSION_PCT, 0)) "합계"
FROM EMPLOYEES E, DEPARTMENTS D
WHERE 
	E.DEPARTMENT_ID = D.DEPARTMENT_ID
	AND
	E.COMMISSION_PCT IS NULL
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME;

-- 12. 최대급여와 최소급여의 차가 가장 큰 직무를 수행하는 직원들의
--      직무아이디, 직무명, 직원아이디, 풀네임을 조회
SELECT J.JOB_ID  "직무아이디", J.JOB_TITLE "직무명"
	, E.EMPLOYEE_ID "직원아이디", E.FIRST_NAME||' '||E.LAST_NAME "풀네임"
FROM EMPLOYEES E, JOBS J
WHERE J.MAX_SALARY - J.MIN_SALARY = (
	SELECT MAX(MAX_SALARY - MIN_SALARY) FROM JOBS
);

-- 13. 직무수행시간(END_DATE - START_DATE)이 가장 길었던 직무를 수행했던 부서에
--      근무하는 직원들의 직무아이디, 직무명, 부서명, 직원아이디, 풀네임을 조회

-- 14. 시애틀(Seattle)에 있는 부서에 근무하는 모든 직원들의
--      부서아이디, 부서명, 직원아이디, 풀네임을 조회
SELECT D.DEPARTMENT_ID "부서아이디", D.DEPARTMENT_NAME "부서명"
	, E.EMPLOYEE_ID "직원아이디", E.FIRST_NAME || ' ' || E.LAST_NAME "풀네임"
FROM 
	EMPLOYEES E, DEPARTMENTS D 
WHERE 
	E.DEPARTMENT_ID = D.DEPARTMENT_ID
	AND
	D.LOCATION_ID = (
		SELECT LOCATION_ID
		FROM LOCATIONS
		WHERE CITY = 'Seattle'
	);

-- 15. 유럽(Europe)에 있는 도시들에 있는 모든 부서에 근무하는 직원들의
--      도시명, 부서아이디, 부서명, 직원아이디, 풀네임을 조회
SELECT L.CITY "도시명", D.DEPARTMENT_ID "부서아이디", D.DEPARTMENT_NAME "부서명"
	, E.EMPLOYEE_ID "직원아이디" , E.FIRST_NAME || ' ' || E.LAST_NAME "풀네임"
FROM 
	EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE 
	E.DEPARTMENT_ID = D.DEPARTMENT_ID
	AND 
	D.LOCATION_ID = L.LOCATION_ID
	AND 
	L.COUNTRY_ID = C.COUNTRY_ID
	AND
	C.REGION_ID = R.REGION_ID
	AND
	R.REGION_NAME = 'Europe';

-- 16. 유럽(Europe)에 위치하고 있는 부서들 중 직원수가 가장 많은 부서의
--      도시명, 부서아이디, 부서명, 직원수를 조회
SELECT * 
FROM (
	SELECT L.CITY, D.DEPARTMENT_ID ,D.DEPARTMENT_NAME , MAX(E.EMPLOYEE_ID) MAX_EID
	FROM 
		EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
	WHERE
		E.DEPARTMENT_ID = D.DEPARTMENT_ID
		AND 
		D.LOCATION_ID = L.LOCATION_ID
		AND 
		L.COUNTRY_ID = C.COUNTRY_ID
		AND
		C.REGION_ID = R.REGION_ID
		AND
		R.REGION_NAME = 'Europe'
	GROUP BY L.CITY, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
	ORDER BY MAX_EID DESC
)
WHERE ROWNUM = 1;













