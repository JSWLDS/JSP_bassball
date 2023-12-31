drop table tbl_player_info;
create table tbl_player_info (
    REGISTRATION_CODE CHAR(4) NOT NULL PRIMARY KEY,
    NAME VARCHAR2(18),
    BIRTH_DAY VARCHAR2(8),
    HEIGHT NUMBER(3),
    WEIGHT NUMBER(3)
);

INSERT INTO TBL_PLAYER_INFO (REGISTRATION_CODE, NAME, BIRTH_DAY, HEIGHT, WEIGHT) VALUES ('A001', '김길동', '19900101', 180, 82);
INSERT INTO TBL_PLAYER_INFO (REGISTRATION_CODE, NAME, BIRTH_DAY, HEIGHT, WEIGHT) VALUES ('A005', '이길동', '20000101', 190, 85);
INSERT INTO TBL_PLAYER_INFO (REGISTRATION_CODE, NAME, BIRTH_DAY, HEIGHT, WEIGHT) VALUES ('B002', '홍길동', '19950101', 175, 75);
INSERT INTO TBL_PLAYER_INFO (REGISTRATION_CODE, NAME, BIRTH_DAY, HEIGHT, WEIGHT) VALUES ('B006', '조길동', '19950101', 185, 80);


drop table TBL_HITTER_INFO;
CREATE TABLE tbl_hitter_info (
    REGISTRATION_CODE CHAR(4) NOT NULL,
    GAME_NUMBERS NUMBER(3),
    APPEARANCE NUMBER(3),
    HIT_NUMBERS NUMBER(3),
    HOME_RUNS NUMBER(3),
    PUT_OUT NUMBER(3),
    DOUBLE_PLAY NUMBER(3),
    ERROR_COUNT NUMBER(3)
);
INSERT INTO TBL_HITTER_INFO (REGISTRATION_CODE, GAME_NUMBERS, APPEARANCE, HIT_NUMBERS, HOME_RUNS, PUT_OUT, DOUBLE_PLAY, ERROR_COUNT) VALUES ('A001', 120, 330, 100, 20, 80, 27, 1);
INSERT INTO TBL_HITTER_INFO (REGISTRATION_CODE, GAME_NUMBERS, APPEARANCE, HIT_NUMBERS, HOME_RUNS, PUT_OUT, DOUBLE_PLAY, ERROR_COUNT) VALUES ('A005', 110, 300, 110, 30, 60, 5, 2);
INSERT INTO TBL_HITTER_INFO (REGISTRATION_CODE, GAME_NUMBERS, APPEARANCE, HIT_NUMBERS, HOME_RUNS, PUT_OUT, DOUBLE_PLAY, ERROR_COUNT) VALUES ('B002', 100, 270, 90, 5, 100, 10, 3);








SELECT P.REGISTRATION_CODE, P.NAME, H.GAME_NUMBERS, H.APPEARANCE, H.HIT_NUMBERS, H.HOME_RUNS, 
TO_CHAR((((H.HIT_NUMBERS + H.HOME_RUNS) / H.APPEARANCE) * 100) + H.HOME_RUNS, '999.00') AS ATK_POINT ,
H.PUT_OUT, H.DOUBLE_PLAY, H.ERROR_COUNT, (H.PUT_OUT + (H.DOUBLE_PLAY * 2) - (H.ERROR_COUNT * 5)) AS DEF
FROM TBL_PLAYER_INFO P
INNER 
	JOIN TBL_HITTER_INFO H ON P.REGISTRATION_CODE = H.REGISTRATION_CODE 
WHERE P.REGISTRATION_CODE LIKE 'A001';


SELECT P.REGISTRATION_CODE, P.NAME, SUBSTR(BIRTH_DAY, 0, 4)||'년'||SUBSTR(BIRTH_DAY, 5, 2
)||'월'||SUBSTR(BIRTH_DAY, 7, 2)||'일' AS PDATE,
P.HEIGHT, P.WEIGHT, DECODE(SUBSTR(P.REGISTRATION_CODE, 1, 1), 'A', '1군', 'B', '2군') AS reserve,
ROUND((((((H.HIT_NUMBERS + H.HOME_RUNS) / H.APPEARANCE) * 100) + H.HOME_RUNS) + ((H.PUT_OUT + (H.DOUBLE_PLAY * 2) - (H.ERROR_COUNT * 5))))/2) AS TOTAL,
RANK() OVER(ORDER BY (((H.HIT_NUMBERS + H.HOME_RUNS) / H.APPEARANCE) * 100) + ((H.PUT_OUT + (H.DOUBLE_PLAY * 2) - (H.ERROR_COUNT * 5)))/2 DESC ) AS RANK
FROM TBL_PLAYER_INFO P
INNER 
	JOIN TBL_HITTER_INFO H ON P.REGISTRATION_CODE = H.REGISTRATION_CODE
ORDER BY 8;


SELECT NVL(REGISTRATION_CODE, '0'), NAME FROM tbl_player_info where REGISTRATION_CODE like 'asd';

SELECT REGISTRATION_CODE FROM TBL_PLAYER_INFO WHERE REGISTRATION_CODE  like 'asd';


SELECT ROUND((((((H.HIT_NUMBERS + H.HOME_RUNS) / H.APPEARANCE) * 100) + H.HOME_RUNS) + ((H.PUT_OUT + (H.DOUBLE_PLAY * 2) - (H.ERROR_COUNT * 5))))/2)
FROM TBL_HITTER_INFO H;





