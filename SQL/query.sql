--basic query    
-- 1. 用user id搜user
-- 2. 列出一周的預約
-- 3. 列出一個月的預約
-- 4. insert新的預約
-- 5. 列出一個user的violation

----------------------------------------------------------------
-- 1. 用user id搜user
-- 用user id搜user 的id、名子、職位、信箱
SET @ID = 111550105;

SELECT 
    UserID,UserName,UserType,Email
FROM
    USER
WHERE 
    UserID = ID

--  用user id搜user 的id、名子、密碼
--  用於顯示較隱私的個資
SELECT
    UserID,UserName,UserPassword
FROM
    USER
WHERE
    UserID = ID
----------------------------------------------------------------
-- 2.3. 列出一周的預約 一個月其實就是把day 改時段而已
set @startday = '2023-01-01';
set @endday = '2023-12-31';

SELECT 
    u.UserID,u.UserName,r.RoomName,r.RoomType,
FROM
    User as u, booking as b,Room as r,timetable as tb
WHERE
    u.UserID = b.UserID and b.RoomID = r.RoomID and
    tb.bookingID = b.booking and tb.timeDate>=current_date 
    and tb.timeDate<=current_date+6
ORDER BY
    tb.timeDate desc

----------------------------------------------------------------
-- 4. insert新的預約

INSERT INTO Booking (UserID, RoomID, Purpose)
VALUES (value1, value2, value3);

UPDATE timetable
SET timeStatus=1,
    bookingID=value
where timeDate=value and timeTime=value

----------------------------------------------------------------
-- 5.列出一個user的violation

SELECT
    UserID,UserName,UserType,ViolationID,Reason,EndDate
FROM
    Violation as v,User as u
WHERE
    v.ViolatorID = u.UserID


-- user 的密碼預設 都是 00000000
-- user 的type 暫定都只一般社員 
-- teacher student member other