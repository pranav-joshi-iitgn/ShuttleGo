USE ShuttleGo;

START TRANSACTION;

CREATE TABLE Member (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Image BLOB,
    DateOfBirth DATE NOT NULL,
    IITGNEmail VARCHAR(255) NOT NULL UNIQUE,
    MobileNumber VARCHAR(10) NOT NULL,
    check ((IITGNEmail like "%@iitgn.ac.in") and not (IITGNEmail like "% %"))
);
CREATE TABLE Bus (
    BusID INT PRIMARY KEY AUTO_INCREMENT,
    BusRegistrationNumber VARCHAR(11) NOT NULL,
    Capacity INT
);
CREATE TABLE Driver (
    DriverID INT PRIMARY KEY AUTO_INCREMENT,
    DriverName VARCHAR(255) NOT NULL,
    DriverMobileNumber VARCHAR(10) NOT NULL
);
CREATE TABLE Route (
    RouteID INT PRIMARY KEY,
    StartLocation VARCHAR(255) NOT NULL,
    EndLocation VARCHAR(255) NOT NULL,
    IntermediateLocations VARCHAR(255)
);
CREATE TABLE Schedule (
    JourneyID INT PRIMARY KEY AUTO_INCREMENT,
    BusID INT,
    DriverID INT,
    RouteID INT,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    DepartueDay DATE NOT NULL,
    FOREIGN KEY (BusID) REFERENCES Bus(BusID),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (RouteID) REFERENCES Route(RouteID)
);
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    JourneyID INT,
    UserID INT,
    Seat INT,
   FOREIGN KEY (JourneyID) REFERENCES
  Schedule(JourneyID),
  FOREIGN KEY (UserID) REFERENCES
 Member(MemberID)
);

CREATE TABLE Boarding (
    BookingID INT PRIMARY KEY,
    JourneyID INT,
    JourneyDate DATE NOT NULL,
    Boarded BOOLEAN,
    FOREIGN KEY (JourneyID) REFERENCES Schedule(JourneyID),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

CREATE TABLE LiveLocation (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    BusID INT,
    Latitude FLOAT,
    Longitude FLOAT,
    LastUpdatedTime TIME,
    FOREIGN KEY (BusID) REFERENCES Bus(BusID)
);
CREATE TABLE Penalty (
    PenaltyID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    NumberOfMisses INT,
    PenaltyAmount INT,
    PenaltyDate DATE,
    FOREIGN KEY (UserID) REFERENCES Member(MemberID)
);
CREATE TABLE Authorities (
    AuthorityID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL
);
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    BusID INT,
    FeedbackText TEXT,
    Rating INT,
    FeedbackDate DATE,
    FOREIGN KEY (UserID) REFERENCES Member(MemberID),
    FOREIGN KEY (BusID) REFERENCES Bus(BusID)
);

CREATE TABLE Tickets (
    TicketID VARCHAR(255) PRIMARY KEY,
    BookingID INT UNIQUE,
    Departure_Date DATE,
    StartTime TIME,
    EndTime TIME,
    SeatNumber INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);


CREATE TABLE ReturnCode (
    val BOOLEAN
);

INSERT INTO ReturnCode VALUES (true);

-- Inserting data
INSERT INTO Member (MemberID, Name, Image, DateOfBirth, IITGNEmail, MobileNumber)
VALUES (1, 'ABCD', NULL, '2025-02-26', 'abcd@iitgn.ac.in', '1234567890');
INSERT INTO Bus (BusID, BusRegistrationNumber, Capacity)
VALUES (1, 'GJ01ABC1234', 50);
INSERT INTO Driver (DriverID, DriverName, DriverMobileNumber)
VALUES (1, 'XYZ', '1234567890');
INSERT INTO Route (RouteID, StartLocation, EndLocation, IntermediateLocations)
VALUES (1, 'IITGN', 'Kudasan', 'Dholakuva Metro Station, Rakshashakti Circle');
INSERT INTO Schedule (JourneyID, BusID, DriverID, RouteID, StartTime, EndTime, DepartueDay)
VALUES (1, 1, 1, 1, '20:00:00', '20:30:00',"2025-02-28");
INSERT INTO Bookings (BookingID, JourneyID, UserID, Seat)
VALUES (1, 1, 1, 1);
INSERT INTO LiveLocation (LocationID, BusID, Latitude, Longitude, LastUpdatedTime)
VALUES (1, 1, 23.123, 72.123, '08:00:00');
INSERT INTO Penalty (PenaltyID, UserID, NumberOfMisses, PenaltyAmount, PenaltyDate)
VALUES (1, 1, 3, 100, '2025-02-26');
INSERT INTO Authorities (AuthorityID, Name, Email, Password)
VALUES (1, 'PQR', 'pqr@iitgn.ac.in', 'hashed_password');
INSERT INTO Feedback (FeedbackID, UserID, BusID, FeedbackText, Rating, FeedbackDate)
VALUES (1, 1, 1, 'Good Service', 4, '2025-02-26');


CREATE VIEW today as (SELECT DATE(NOW()));
CREATE VIEW rn as (SELECT NOW());
CREATE VIEW tommorrow as (select DATE(NOW()) + INTERVAL 1 DAY);
CREATE VIEW tommorrow_schedule as (SELECT * from Schedule where DepartueDay = (select * from tommorrow));

delimiter //

CREATE PROCEDURE last_30_days(IN usid INT)
BEGIN
SELECT * FROM Boarding WHERE BookingID IN (SELECT BookingID FROM Bookings WHERE usid = UserID and JourneyDate < DATE(NOW()) and JourneyDate > DATE(NOW()) - INTERVAL 30 DAY);
END //


CREATE PROCEDURE create_new_user(IN mid INT, IN nam VARCHAR(255), IN im BLOB, IN dob DATE, IN email VARCHAR(255), IN mob VARCHAR(10))
BEGIN
INSERT INTO Member (MemberID, Name, Image, DateOfBirth, IITGNEmail, MobileNumber)
VALUES (mid, nam, im, dob, email, mob);
END //

CREATE PROCEDURE create_new_bus(IN brn VARCHAR(11), IN cap INT)
BEGIN
INSERT INTO Bus (BusRegistrationNumber, Capacity)
VALUES (brn, cap);
END //

CREATE PROCEDURE create_new_driver(IN nam VARCHAR(255),mob VARCHAR(10))
BEGIN
INSERT INTO Driver (DriverName, DriverMobileNumber)
VALUES (nam, mob);
END//

CREATE PROCEDURE create_new_route(IN rid INT, IN sl VARCHAR(255), IN el VARCHAR(255), IN intloc VARCHAR(255))
BEGIN
INSERT INTO Route (RouteID, StartLocation, EndLocation, IntermediateLocations)
VALUES (rid, sl, el, intloc);
END//


CREATE PROCEDURE create_new_schedule(IN bid INT, IN did INT, IN rid INT, IN st TIME, IN et TIME, IN dd DATE)
BEGIN
INSERT INTO Schedule (BusID, DriverID, RouteID, StartTime, EndTime, DepartueDay)
VALUES (bid, did, rid, st, et, dd);
END//

CREATE PROCEDURE create_new_booking(IN jid INT, IN usid INT, IN st INT)
BEGIN
INSERT INTO Bookings (JourneyID, UserID, Seat)
VALUES (jid, usid, st);
END//

CREATE PROCEDURE cancel_booking(IN bid INT)
BEGIN
CREATE TEMPORARY TABLE a as (SELECT (DepartueDay > DATE(NOW()) or StartTime > (TIME(NOW()) + INTERVAL 3 HOUR)) as val from Schedule where JourneyID in (SELECT JourneyID FROM Bookings where BookingID = bid));
CREATE TEMPORARY TABLE b as (SELECT (count(*) > 0) as val from Bookings where BookingID = bid);
DELETE FROM Bookings WHERE BookingID = bid and (select * from a);
UPDATE ReturnCode SET val = (true in (select a.val and b.val from a,b));
DROP TABLE a;
DROP TABLE b;
SELECT * FROM ReturnCode;
END//

CREATE PROCEDURE verify_new_booking(IN jid INT, IN usid INT, IN st INT)
WITH 
journ as (SELECT * from Schedule where jid = JourneyID),
seated as (SELECT count(*) as val from Bookings where JourneyID = jid and (Seat = st or usid = UserID))
SELECT 1-count(*) from journ,seated where val > 0 or not (DepartueDay > DATE(NOW()) or StartTime > TIME(NOW()) + INTERVAL 3 HOUR);
END //

CREATE PROCEDURE create_new_boarding(IN bid INT, IN seated BOOLEAN)
BEGIN
INSERT INTO Boarding (BookingID,JourneyID,JourneyDate,Boarded)
SELECT BookingID,Bookings.JourneyID,DepartueDay,seated FROM Bookings,Schedule WHERE BookingID = bid and Bookings.JourneyID = Schedule.JourneyID;
END//

CREATE PROCEDURE GetLiveLocation(IN bus_id INT)
BEGIN
    SELECT Latitude, Longitude, LastUpdatedTime
    FROM LiveLocation
    WHERE BusID = bus_id
    ORDER BY LastUpdatedTime DESC
    LIMIT 1;
END //

CREATE PROCEDURE UpdateLiveLocation(IN bus_id INT, IN lat FLOAT, IN lon FLOAT)
BEGIN
    UPDATE LiveLocation
    SET Latitude = lat, Longitude = lon, LastUpdatedTime = NOW()
    WHERE BusID = bus_id;
END //


CREATE PROCEDURE GenerateTicket(IN bid INT) -- Generates a ticket, returns journey info to user, adds the ticket to the 'tickets' table for conductor to verify.
BEGIN
    DECLARE ticketID VARCHAR(255);
    DECLARE depDay DATE;
    DECLARE st TIME;
    DECLARE et TIME;
    DECLARE seatNumber INT;
    DECLARE startLoc VARCHAR(255);
    DECLARE endLoc VARCHAR(255);

    SELECT s.DepartueDay, s.StartTime, s.EndTime, b.Seat, r.StartLocation, r.EndLocation
    INTO depDay, st, et, seatNumber, startLoc, endLoc
    FROM Bookings b
    JOIN Schedule s ON b.JourneyID = s.JourneyID
    JOIN Route r ON s.RouteID = r.RouteID
    WHERE b.BookingID = bid;

    SET ticketID = CONCAT('TICKET-', bid, '-', UNIX_TIMESTAMP(NOW()));

    INSERT INTO Tickets (TicketID, BookingID, DepartueDay, StartTime, EndTime, SeatNumber)
    VALUES (ticketID, bid, depDay, st, et, seatNumber);

    SELECT ticketID AS TicketIdentifier, depDay AS Departure_Date, st AS Start_Time, et AS End_Time, 
           seatNumber AS Seat_Number, startLoc AS Start_Location, endLoc AS End_Location;
END //


CREATE PROCEDURE VerifyTicket(IN ticketID VARCHAR(255))
BEGIN
    DECLARE depDay DATE;
    DECLARE st TIME;
    DECLARE et TIME;
    DECLARE seatNumber INT;
    DECLARE startLoc VARCHAR(255);
    DECLARE endLoc VARCHAR(255);
    DECLARE bookingID INT;
    DECLARE journeyID INT;
    DECLARE isValid BOOLEAN DEFAULT FALSE;

    SELECT t.DepartueDay, t.StartTime, t.EndTime, t.SeatNumber, 
           r.StartLocation, r.EndLocation, t.BookingID, b.JourneyID
    INTO depDay, st, et, seatNumber, startLoc, endLoc, bookingID, journeyID
    FROM Tickets t
    JOIN Bookings b ON t.BookingID = b.BookingID
    JOIN Schedule s ON b.JourneyID = s.JourneyID
    JOIN Route r ON s.RouteID = r.RouteID
    WHERE t.TicketID = ticketID;

    IF depDay = CURDATE() AND et > CURTIME() THEN
        SET isValid = TRUE;
    END IF;

    IF isValid THEN
        INSERT INTO Boarding (BookingID, JourneyID, JourneyDate, Boarded)
        VALUES (bookingID, journeyID, depDay, TRUE);

        SELECT 'Valid' AS Status, ticketID AS TicketIdentifier, depDay AS Date, 
               st AS Start_Time, et AS End_Time, seatNumber AS Seat_Number, 
               startLoc AS Start_Location, endLoc AS End_Location;
    ELSE
        SELECT 'Invalid or Expired' AS Status;
    END IF;
END //

CREATE PROCEDURE GetUserBusUsage(IN usid INT)
BEGIN
    SELECT 
        B.BookingID,
        S.DepartueDay,
        S.StartTime,
        S.EndTime,
        R.StartLocation,
        R.EndLocation,
        Bus.BusRegistrationNumber,
        D.DriverName,
        B.Seat,
        Brd.Boarded
    FROM Bookings B
    JOIN Schedule S ON B.JourneyID = S.JourneyID
    JOIN Route R ON S.RouteID = R.RouteID
    JOIN Bus ON S.BusID = Bus.BusID
    JOIN Driver D ON S.DriverID = D.DriverID
    LEFT JOIN Boarding Brd ON B.BookingID = Brd.BookingID
    WHERE B.UserID = usid
    AND S.DepartueDay >= DATE(NOW()) - INTERVAL 30 DAY;
END //

CREATE PROCEDURE GetBusUsageByBus(IN busid INT)
BEGIN
    SELECT 
        S.JourneyID,
        S.DepartueDay,
        S.StartTime,
        S.EndTime,
        R.StartLocation,
        R.EndLocation,
        COUNT(B.BookingID) AS SeatsBooked  -- Counting booked seats per journey
    FROM Schedule S
    JOIN Route R ON S.RouteID = R.RouteID
    LEFT JOIN Bookings B ON S.JourneyID = B.JourneyID
    WHERE S.BusID = busid
    AND S.DepartueDay >= DATE(NOW()) - INTERVAL 30 DAY
    GROUP BY S.JourneyID, S.DepartueDay, S.StartTime, S.EndTime, R.StartLocation, R.EndLocation;
END //

delimiter ;
