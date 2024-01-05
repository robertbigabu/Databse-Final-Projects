----------------------------------------------------------------
--USER
CREATE TABLE public.Users(
    UserID                      INT,            
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
    BookingTime                 INT,
    Purpose                     Varchar(150),
    primary key (bookingID),
    foreign key (UserID) references Users(UserID),
    foreign key (RoomID) references Room(RoomID)
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
