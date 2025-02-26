USE ShuttleGo;

START TRANSACTION;

CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Image BLOB,
    DateOfBirth DATE NOT NULL,
    IITGNEmail VARCHAR(255) NOT NULL UNIQUE,
    MobileNumber VARCHAR(10) NOT NULL,
    check ((IITGNEmail like "%@iitgn.ac.in") and not (IITGNEmail like "% %"))
);
CREATE TABLE Bus (
    BusID INT PRIMARY KEY,
    BusRegistrationNumber VARCHAR(11) NOT NULL,
    Capacity INT
);
CREATE TABLE Driver (
    DriverID INT PRIMARY KEY,
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
    JourneyID INT PRIMARY KEY,
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
    BookingID INT PRIMARY KEY,
    JourneyID INT,
    UserID INT,
    Seat INT,
   FOREIGN KEY (JourneyID) REFERENCES
  Schedule(JourneyID),
  FOREIGN KEY (UserID) REFERENCES
 Member(MemberID)
);

CREATE TABLE Boarded (
    BookingID INT PRIMARY KEY,
    JourneyID INT,
    JorneyDate DATE NOT NULL,
    Boarded BOOLEAN,
    FOREIGN KEY (JourneyID) REFERENCES
    Schedule(JourneyID)
);
CREATE TABLE LiveLocation (
    LocationID INT PRIMARY KEY,
    BusID INT,
    Latitude FLOAT,
    Longitude FLOAT,
    LastUpdatedTime TIME,
    FOREIGN KEY (BusID) REFERENCES Bus(BusID)
);
CREATE TABLE Penalty (
    PenaltyID INT PRIMARY KEY,
    UserID INT,
    NumberOfMisses INT,
    PenaltyAmount INT,
    PenaltyDate DATE,
    FOREIGN KEY (UserID) REFERENCES Member(MemberID)
);
CREATE TABLE Authorities (
    AuthorityID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL
);
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    UserID INT,
    BusID INT,
    FeedbackText TEXT,
    Rating INT,
    FeedbackDate DATE,
    FOREIGN KEY (UserID) REFERENCES Member(MemberID),
    FOREIGN KEY (BusID) REFERENCES Bus(BusID)
);

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
VALUES (1, 1, 1, 1, '08:00:00', '08:30:00',"2025-02-28");
INSERT INTO Bookings (BookingID, JourneyID, UserID, Seat)
VALUES (1, 1, 1, 1);
INSERT INTO Boarded (BookingID, JourneyID, JorneyDate, Seat)
VALUES (1, 1, '2025-02-26', true);
INSERT INTO LiveLocation (LocationID, BusID, Latitude, Longitude, LastUpdatedTime)
VALUES (1, 1, 23.123, 72.123, '08:00:00');
INSERT INTO Penalty (PenaltyID, UserID, NumberOfMisses, PenaltyAmount, PenaltyDate)
VALUES (1, 1, 3, 100, '2025-02-26');
INSERT INTO Authorities (AuthorityID, Name, Email, Password)
VALUES (1, 'PQR', 'pqr@iitgn.ac.in', 'hashed_password');
INSERT INTO Feedback (FeedbackID, UserID, BusID, FeedbackText, Rating, FeedbackDate)
VALUES (1, 1, 1, 'Good Service', 4, '2025-02-26');


INSERT INTO Schedule (JourneyID, BusID, DriverID, RouteID, StartTime, EndTime, DepartueDay)
VALUES (1, 1, 1, 1, '03:00:00', '08:30:00',"2025-02-27");



CREATE VIEW today as (SELECT DATE(NOW()));
CREATE VIEW rn as (SELECT NOW());
CREATE VIEW tommorrow as (select DATE(NOW()) + INTERVAL 1 DAY);
CREATE VIEW tommorrow_schedule as (SELECT * from Schedule where DepartueDay = (select * from tommorrow));


delimiter //

CREATE PROCEDURE create_new_user(IN mid INT, IN nam VARCHAR(255), IN im BLOB, IN dob DATE, IN email VARCHAR(255), IN mob VARCHAR(10))
BEGIN
INSERT INTO Member (MemberID, Name, Image, DateOfBirth, IITGNEmail, MobileNumber)
VALUES (mid, nam, im, dob, email, mob);
END //

CREATE PROCEDURE create_new_bus(IN bid INT, IN brn VARCHAR(11), IN cap INT)
BEGIN
INSERT INTO Bus (BusID, BusRegistrationNumber, Capacity)
VALUES (bid, brn, cap);
END //

CREATE PROCEDURE create_new_driver(IN did INT, IN nam VARCHAR(255),MOB VARCHAR(10))
BEGIN
INSERT INTO Driver (DriverID, DriverName, DriverMobileNumber)
VALUES (did, nam, mod);
END//

CREATE PROCEDURE create_new_route(IN rid INT, IN sl VARCHAR(255), IN el VARCHAR(255), IN intloc VARCHAR(255))
BEGIN
INSERT INTO Route (RouteID, StartLocation, EndLocation, IntermediateLocations)
VALUES (rid, sl, el, intloc);
END//


CREATE PROCEDURE create_new_schedule(IN jid INT, IN bid INT, In did INT, IN rid INT, IN st TIME, IN et INME, IN dd DATE)
BEGIN
INSERT INTO Schedule (JourneyID, BusID, DriverID, RouteID, StartTime, EndTime, DepartueDay)
VALUES (jid, bid, did, rid, st, et, dd);
END//

CREATE PROCEDURE create_new_booking(IN bid INT, IN jid INT, IN usid INT, IN st INT)
BEGIN
INSERT INTO Bookings (BookingID, JourneyID, UserID, Seat)
VALUES (bid, jid, usid, st);
END//

CREATE PROCEDURE verify_new_booking(IN bid INT, IN jid INT, IN usid INT, IN st INT)
WITH 
journ as (SELECT * from Schedule where jid = JourneyID),
seated as (SELECT count(*) as val from Bookings where JourneyID = jid and (Seat = st or usid = UserID))
SELECT 1-count(*) from journ,seated where val > 0 or not (DepartueDay > DATE(NOW()) or StartTime > TIME(NOW()) + INTERVAL 3 HOUR);
END //

delimiter ;

