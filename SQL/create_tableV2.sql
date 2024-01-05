----------------------------------------------------------------
--USER
CREATE TABLE public.Users(
    UserID                      Serial,            
    UserName                    VARCHAR (32),
    Email                       VARCHAR (256),
    UserPassword                VARCHAR (60),
    UserType                    VARCHAR (16),

    primary key (UserID)
);
----------------------------------------------------------------
--Resourse
--ROOM
CREATE TABLE public.Room(
    RoomID                      Serial,            
    RoomName                    VARCHAR (32),
    RoomType                    VARCHAR (16),
    Location                    VARCHAR (16),
    Capacity                    INT,

    primary key (RoomID)
);

----------------------------------------------------------------
--Booking
CREATE TABLE public.booking(
    bookingID                   Serial,
    UserID                      INT,
    RoomID                      INT,
    BookingDate                 date,
    1                     Varchar(150),
    primary key (bookingID),
    foreign key (UserID) references Users(UserID),
    foreign key (RoomID) references Room(RoomID),
);
----------------------------------------------------------------
--Time table
CREATE TABLE public.timetable(
    timeDate                    date,
    timeTime                    INT,
    timeStatus                  INT,
    -- 0 for idle
    -- 1 for reserved
    BookingID                   INT,
    primary key (Date,Time,BookingID),
    foreign key (BookingID) references booking(bookingID),
);
----------------------------------------------------------------
--Violation
CREATE TABLE public.Violation(
    ViolationID                 Serial,
    ViolatorID                  INT,
    Reason                      VARCHAR(256),
    EndDate                     date,

    primary key (ViolationID),
    foreign key (ViolatorID) references Users(UserID)
);
----------------------------------------------------------------