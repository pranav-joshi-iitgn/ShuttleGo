USE ShuttleGo;

START TRANSACTION;

CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Image BLOB,
    DateOfBirth DATE NOT NULL,
    IITGNEmail VARCHAR(255) NOT NULL UNIQUE,
    MobileNumber VARCHAR(10) NOT NULL
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
    FOREIGN KEY (BusID) REFERENCES Bus(BusID),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (RouteID) REFERENCES Route(RouteID)
);
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    JourneyID INT,
    UserID INT,
    JorneyDate DATE NOT NULL,
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

CREATE PROCEDURE create_new_driver()
BEGIN
INSERT INTO Driver (DriverID, DriverName, DriverMobileNumber)
VALUES (1, 'XYZ', '1234567890');
END//

CREATE PROCEDURE create_new_route()
BEGIN
INSERT INTO Route (RouteID, StartLocation, EndLocation, IntermediateLocations)
VALUES (1, 'IITGN', 'Kudasan', 'Dholakuva Metro Station, Rakshashakti Circle');
END//


CREATE PROCEDURE create_new_schedule()
BEGIN
INSERT INTO Schedule (JourneyID, BusID, DriverID, RouteID, StartTime, EndTime)
VALUES (1, 1, 1, 1, '08:00:00', '08:30:00');
END//

CREATE PROCEDURE create_new_booking()
BEGIN
INSERT INTO Bookings (BookingID, JourneyID, UserID, JorneyDate, Seat)
VALUES (1, 1, 1, '2025-02-26', 1);
END//

delimiter ;

CREATE PROCEDURE create_new_boarded ()
INSERT INTO Boarded (BookingID, JourneyID, JorneyDate, Seat)
VALUES (1, 1, '2025-02-26', true);

CREATE PROCEDURE create_new_live_location ()
INSERT INTO LiveLocation (LocationID, BusID, Latitude, Longitude, LastUpdatedTime)
VALUES (1, 1, 23.123, 72.123, '08:00:00');

CREATE PROCEDURE create_new_penalty ()
INSERT INTO Penalty (PenaltyID, UserID, NumberOfMisses, PenaltyAmount, PenaltyDate)
VALUES (1, 1, 3, 100, '2025-02-26');

CREATE PROCEDURE create_new_authority ()
INSERT INTO Authorities (AuthorityID, Name, Email, Password)
VALUES (1, 'PQR', 'pqr@iitgn.ac.in', 'hashed_password');

CREATE PROCEDURE create_new_feedback ()
INSERT INTO Feedback (FeedbackID, UserID, BusID, FeedbackText, Rating, FeedbackDate)
VALUES (1, 1, 1, 'Good Service', 4, '2025-02-26');
