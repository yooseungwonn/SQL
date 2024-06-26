CREATE TABLE board (
	no number PRIMARY KEY,
    title varchar2(128) NOT NULL,
    content varchar2(255) NOT NULL,
    hit number DEFAULT 0,
    reg_date date DEFAULT sysdate,
    user_no number NOT NULL
);

CREATE SEQUENCE seq_board_pk
    START WITH 1
    INCREMENT BY 1;
    
INSERT INTO board(
    no, title, content, user_no)
VALUES(seq_board_pk.nextval, '첫번째 게시물입니다',
       '첫번째 게시물입니다. 잘되나요?', 46);
       
SELECT b.no, b.title, b.content, b.hit, b.reg_date as regDate,
	       b.user_no as userNo, u.name as userName
	FROM board b, users u
	WHERE b.user_no = u.no;
