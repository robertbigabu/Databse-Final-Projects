
SET NAMES 'utf8mb4';
-- form original Excel
-- partion into two part

-- band
CREATE TABLE public.Band (
    BandID SERIAL PRIMARY KEY,
    BandName VARCHAR(32),
    ManagerName VARCHAR(32),
    Major_Year VARCHAR(32),
    ManagerPhone CHAR(12)
);

-- time slot
CREATE TABLE public.Schedule (
    ScheduleID SERIAL PRIMARY KEY,
    BandID INT,
    Date DATE,
    TimeSlot TIME,
    Activity VARCHAR(255),
    FOREIGN KEY (BandID) REFERENCES public.Band(BandID)
);

-- copy band part
COPY public.band(BandName,ManagerName,Major_Year,ManagerPhone)
FROM ''
DELIMITER ',' 
CSV HEADER;

--i dont know how to copy time slot part