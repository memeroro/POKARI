-- 번호(bid), 제목(btitle), 내용(bcontent), 작성자(bwriter), 조회수(bcount),
-- 작성일시(bregdate), 파일명(cfn), 분류명(bsort), 댓글개수(rcount)
CREATE TABLE BOARD (
	BID NUMBER PRIMARY KEY,
	BTITLE VARCHAR2(2000) NOT NULL,
	BCONTENT VARCHAR2(4000),
	BWRITER VARCHAR2(200) NOT NULL,
	BCOUNT NUMBER,
	BREGDATE TIMESTAMP,
	BSORT VARCHAR2(200),
	CFN VARCHAR2(200),
	RCOUNT NUMBER
);

CREATE SEQUENCE SEQ_BOARD;

CREATE TABLE REPLY (
	RID NUMBER PRIMARY KEY,
	RWRITER VARCHAR2(200) NOT NULL,
	RCONTENT VARCHAR2(4000),
	RREGDATE TIMESTAMP,
	BID NUMBER,
	FOREIGN KEY (BID) REFERENCES BOARD(BID)
);

CREATE SEQUENCE SEQ_REPLY;

CREATE TABLE MEMBER (
	MID VARCHAR2(200) PRIMARY KEY,
	MPASS VARCHAR2(200) NOT NULL
);

INSERT INTO MEMBER VALUES('hong', '1234');
INSERT INTO MEMBER VALUES('kang', '1234');