--basic query    
-- 1. 用user id搜user
-- 2. 列出一周的預約
-- 3. 列出一個月的預約
-- 4. insert新的預約
-- 5. 列出一個user的violation

----------------------------------------------------------------
-- 1. 用user id搜user
-- 用user id搜user 的id、名子、職位、信箱

SELECT 
    UserID,UserName,UserType,Email
FROM
    USERS
WHERE 
    UserID = 19  --目前不知道 postgresql 的變數要怎麼用
	
--  用user id搜user 的id、名子、密碼
--  用於顯示較隱私的個資
SELECT
    UserID,UserName,UserPassword
FROM
    USERS
WHERE
    UserID = 19  --目前不知道 postgresql 的變數要怎麼用
----------------------------------------------------------------
-- 2.3. 列出一周的預約 一個月其實就是把day 改時段而已

SELECT 
    UserID,UserName,RoomName,RoomType,bookingdate
FROM
    Users natural join booking natural join Room
WHERE
    bookingdate>=current_date and bookingDate<=current_date+6  --把今天當作第一天，往後加6天
ORDER BY
    bookingDate desc

----------------------------------------------------------------
-- 4. insert新的預約

INSERT INTO Booking (bookingID,UserID, RoomID, Purpose, bookingdate, bookingtime)
VALUES (DEFAULT,17, 2 , '團練', '2024-01-13', 12);--目前 bookingID 是用 serial，每 insert 一次會加一，可能有 bug
--比如說我之前的52筆資料是用 import 不是用 insert 的，那麼我需要 insert 53 次才能 insert 成功

----------------------------------------------------------------
-- 5.列出一個user的violation

SELECT
    UserID,UserName,UserType,ViolationID,Reason,EndDate
FROM
    Violation as v,Users as u
WHERE
    v.ViolatorID = u.UserID and u.userid=1  --目前不知道 postgresql 的變數要怎麼用


-- user 的密碼預設 都是 00000000
-- user 的type 暫定都只一般社員 
-- teacher student member other
