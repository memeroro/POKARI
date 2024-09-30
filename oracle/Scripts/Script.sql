DROP TABLE STUDENT;

CREATE TABLE STUDENT (
	SID NUMBER PRIMARY KEY,	-- NOT NULL + UNIQUE
	SNAME VARCHAR2(100) NOT NULL,	-- 널을 허용하지 않음
	SCLASS NUMBER DEFAULT 1,	-- 값을 입력하지 않으면 기본 1을 입력
	SGENDER CHAR(1) CHECK (SGENDER IN ('M',  'F'))	-- 컬럼의 값이 M 또는 F 여야만 한다
);

DROP SEQUENCE STUDENT_SEQ;

CREATE SEQUENCE STUDENT_SEQ
INCREMENT BY 1	-- 1씩 증가
START WITH 1	-- 1부터 시작
MINVALUE 1	-- 최소값 1
MAXVALUE 1000000	-- 최대값 1000000
NOCYCLE	-- 최대값 도달했을때 처음으로 돌아가지 않음
NOCACHE;	-- 캐시 사용하지 않는다

INSERT INTO STUDENT VALUES(STUDENT_SEQ.NEXTVAL, '학생1', 1, 'M');
INSERT INTO STUDENT VALUES(STUDENT_SEQ.NEXTVAL, '학생2', 2, 'F');
INSERT INTO STUDENT VALUES(STUDENT_SEQ.NEXTVAL, '학생3', 3, 'M');
INSERT INTO STUDENT VALUES(STUDENT_SEQ.NEXTVAL, '학생4', 4, 'F');
INSERT INTO STUDENT VALUES(STUDENT_SEQ.NEXTVAL, '학생5', 5, 'M');

COMMIT;

SELECT * FROM STUDENT;

ALTER TABLE STUDENT ADD STEL VARCHAR2(20);

ALTER TABLE STUDENT MODIFY STEL VARCHAR2(30);

-- ALTER TABLE STUDENT MODIFY SNAME NUMBER;

ALTER TABLE STUDENT DROP COLUMN STEL;

ALTER TABLE STUDENT DROP COLUMN SNAME;

DROP TABLE STUDENT;

UPDATE STUDENT SET SNAME='홍길동'
WHERE SID=1;

SELECT * FROM STUDENT;

ROLLBACK;

SELECT * FROM STUDENT;

COMMIT;

SELECT * FROM STUDENT;

UPDATE STUDENT SET SNAME='홍길동'
WHERE SID=1;

COMMIT;

SELECT * FROM STUDENT;

ROLLBACK;

SELECT * FROM STUDENT;

DELETE STUDENT
WHERE SID=5;

SELECT * FROM STUDENT;

ROLLBACK;

SELECT * FROM STUDENT;

CREATE TABLE STUDENT_COPY
AS
SELECT * FROM STUDENT;

SELECT * FROM STUDENT_COPY;

CREATE TABLE STUDENT_COPY_PART
AS
SELECT SNAME, SCLASS FROM STUDENT;

SELECT * FROM STUDENT_COPY_PART;

CREATE TABLE STUDENT_LOW_CLASS
AS
SELECT * FROM STUDENT
WHERE SCLASS<=3;

SELECT * FROM STUDENT_LOW_CLASS;

DROP TABLE STUDENT;

RENAME STUDENT_COPY TO STUDENT;

SELECT * FROM STUDENT;

DROP TABLE STUDENT;
DROP TABLE STUDENT_COPY_PART;
DROP TABLE STUDENT_LOW_CLASS;

DROP SEQUENCE STUDENT_SEQ;

CREATE TABLE STUDENT (
SNO NUMBER PRIMARY KEY,
SNAME VARCHAR2(20),
SAGE NUMBER,
SGENDER CHAR(1),
SUBNO NUMBER,
FOREIGN KEY (SUBNO) REFERENCES SUBJECT(SUBNO)
); 












































































