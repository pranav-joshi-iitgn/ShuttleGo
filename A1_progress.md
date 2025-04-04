# Assignment 1 - ShuttleGo
_Aditya Mangla, Jaidev Sanjay Khalane, Pranav Joshi, Tapananshu Gandhi, Vannsh Jani_


## Functionalities
- [X] Our application will allow users to view the schedule of the buses for the next day.
- [X] To keep track of the buses (based on their registration numbers) as well as the contact numbers and details of their corresponding drivers.
- [X] Allow the users to create their profile (using IITGN email credentials).
- [X] Allow the user to book their rides for the current (or next) day in advance.
- [X] Allow the user to book only one ticket on a single bus.
- [X] Allow users to cancel their bookings up to three hours before their ride.
- [X] Allow the users to download their tickets for the buses (which may have some unique identifier).
- [X] Allow the bus driver/ conductor to verify the tickets of the people boarding the bus using that unique identifier.
- [X] Allow users to view the history of their travels in the last 30 days.
- [X] Allow the authorities to view the usage of buses by any of the users.
- [X] Allow the users to find the live location of the buses.
- [X] Allow the live location of the buses to be updated based on the coordinates obtained from sensor.
- [ ] [Advanced] Addition of a penalty mechanism where the users would be due a fine if they miss three bookings in an interval of 30 days.
- [ ] [Advanced] Addition of a dashboard corresponding to the usage of buses at different times for the authorities, which would enhance their awareness of the demands of buses at various times.

## Tables
![A1](https://github.com/user-attachments/assets/b526a589-ce75-4907-9d79-096704fc35d8)

- ### Member Table
    - Member ID (Primary Key)
    - Name (Not Null)
    - Image
    - Date of birth (Not Null) ## (instead of Age) 
    - IITGN Email (Not Null and Unique)
    - Mobile Number (Not Null)

- ### Bus Table
    - Bus ID (Primary Key)
    - Bus Registration Number (Not Null)
    - Capacity

- ### Driver Table
    - Driver ID (Primary Key)
    - Driver Name (Not Null)
    - Driver Mobile Number (Not Null)

- ### Route Table
    - Route ID (Primary Key)
    - Start Location (Not Null)
    - End Location (Not Null)
    - Intermediate Locations

- ### Schedule Table
    - Journey ID (Primary Key)
    - Bus ID (foreign key referencing Bus Table)
    - Driver ID (foreign key referencing Driver Table)
    - Route ID (foreign key referencing Route Table)
    - Start Time (Not Null)
    - End Time (Not Null)

- ### Bookings Table
    - Booking ID (Primary Key)
    - Journey ID (foreign key referencing Schedule Table)
    - User ID (foreign key referencing Member Table)
    - Date (Not Null)
    - Seat

- ### Boarded Table
    - Booking ID (Primary Key)
    - Journey ID (foreign key referencing Schedule Table)
    - Date (Not Null)
    - Seat (Whether boarded or not - Boolean)

- ### Live Location Table
    - Location ID (Primary Key)
    - Bus ID (foreign key referencing Bus Table)
    - Latitude
    - Longitude
    - Last Updated Time

- ### Penalty Table
    - Penalty ID (Primary Key)
    - User ID (foreign key referencing Member Table)
    - Number of Misses 
    - Penalty Amount
    - Penalty Date

- ### Authorities Table
    - Authority ID (Primary Key)
    - Name (Not Null)
    - Email (Not Null, Unique)
    - Password (Not Null)

- ### Feedback Table
    - Feedback ID (Primary Key)
    - User ID (foreign key referencing Member Table)
    - Bus ID (foreign key referencing Bus Table)
    - Feedback Text
    - Rating (0 to 5)
    - Feedback Date


## SQL Code for Crating Tables 


 ```sql
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
 ```

## SQL Data Insertion Commands


 - For creating a new user
 ```sql
 INSERT INTO Member (MemberID, Name, Image, DateOfBirth, IITGNEmail, MobileNumber)
 VALUES (1, 'ABCD', NULL, '26-02-2025', 'abcd@iitgn.ac.in', '1234567890');
 ```
 - For creating a new bus
 ```sql
 INSERT INTO Bus (BusID, BusRegistrationNumber, Capacity)
 VALUES (1, 'GJ01ABC1234', 50);
 ```
 - For creating a new driver
 ```sql
 INSERT INTO Driver (DriverID, DriverName, DriverMobileNumber)
 VALUES (1, 'XYZ', '1234567890');
 ```
 - For creating a new route
 ```sql
 INSERT INTO Route (RouteID, StartLocation, EndLocation, IntermediateLocations)
 VALUES (1, 'IITGN', 'Kudasan', 'Dholakuva Metro Station, Rakshashakti Circle');
 ```
 - For creating a new schedule
 ```sql
 INSERT INTO Schedule (JourneyID, BusID, DriverID, RouteID, StartTime, EndTime)
 VALUES (1, 1, 1, 1, '08:00:00', '08:30:00');
 ```
 - For creating a new booking
 ```sql
 INSERT INTO Bookings (BookingID, JourneyID, UserID, JorneyDate, Seat)
 VALUES (1, 1, 1, '26-02-2025', 1);
 ```
 - For creating a new boarded
 ```sql
 INSERT INTO Boarded (BookingID, JourneyID, JorneyDate, Seat)
 VALUES (1, 1, '26-02-2025', true);
 ```
 - For creating a new live location
 ```sql
 INSERT INTO LiveLocation (LocationID, BusID, Latitude, Longitude, LastUpdatedTime)
 VALUES (1, 1, 23.123, 72.123, '08:00:00');
 ```
 - For creating a new penalty
 ```sql
 INSERT INTO Penalty (PenaltyID, UserID, NumberOfMisses, PenaltyAmount, PenaltyDate)
 VALUES (1, 1, 3, 100, '26-02-2025');
 ```
 - For creating a new authority
 ```sql
 INSERT INTO Authorities (AuthorityID, Name, Email, Password)
 VALUES (1, 'PQR', 'pqr@iitgn.ac.in', 'hashed_password');
 ```
 - For creating a new feedback
 ```sql
 INSERT INTO Feedback (FeedbackID, UserID, BusID, FeedbackText, Rating, FeedbackDate)
 VALUES (1, 1, 1, 'Good Service', 4, '26-02-2025');
 ```
