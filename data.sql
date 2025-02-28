-- Passanger Table
INSERT INTO Passenger (Name, DateOfBirth, IITGNEmail, MobileNumber) VALUES
('Alice Sharma', '2000-05-15', 'alice.sharma@iitgn.ac.in', '9876543210'),
('Bob Patel', '1999-12-01', 'bob.patel@iitgn.ac.in', '8765432109'),
('Charlie Singh', '2001-03-10', 'charlie.singh@iitgn.ac.in', '7654321098'),
('David Kumar', '2000-08-22', 'david.kumar@iitgn.ac.in', '6543210987'),
('Eva Reddy', '2002-01-05', 'eva.reddy@iitgn.ac.in', '5432109876'),
('Fiona Iyer', '1999-07-18', 'fiona.iyer@iitgn.ac.in', '4321098765'),
('George Menon', '2001-11-29', 'george.menon@iitgn.ac.in', '3210987654'),
('Hannah Joshi', '2000-04-03', 'hannah.joshi@iitgn.ac.in', '2109876543'),
('Ian Thomas', '2002-09-14', 'ian.thomas@iitgn.ac.in', '1098765432'),
('Julie Wilson', '1999-06-25', 'julie.wilson@iitgn.ac.in', '9087654321'),
('Karan Patel', '2001-12-12', 'karan.patel@iitgn.ac.in', '8076543210'),
('Neha Sharma', '2000-02-28', 'neha.sharma@iitgn.ac.in', '7065432109'),
('Vikram Singh', '2002-07-04', 'vikram.singh@iitgn.ac.in', '6054321098'),
('Priya Kumar', '1999-09-21', 'priya.kumar@iitgn.ac.in', '5043210987'),
('Aryan Reddy', '2001-05-08', 'aryan.reddy@iitgn.ac.in', '4032109876');

-- Bus Table
INSERT INTO Bus (BusRegistrationNumber, Capacity) VALUES
('GJ05BP1234', 50),
('GJ05CQ5678', 45),
('GJ05DR9012', 55),
('GJ05ES3456', 40),
('GJ05FT7890', 60),
('GJ05GU2345', 48),
('GJ05HV6789', 52),
('GJ05IW0123', 47),
('GJ05JX4567', 58),
('GJ05KY8901', 43);

-- Driver Table
INSERT INTO Driver (DriverName, DriverMobileNumber) VALUES
('Rajesh Patel', '9988776655'),
('Amit Sharma', '8877665544'),
('Suresh Verma', '7766554433'),
('Deepak Yadav', '6655443322'),
('Kiran Joshi', '5544332211'),
('Vikram Singh', '9876123450'),
('Pooja Reddy', '8765098761'),
('Arjun Iyer', '7654987652'),
('Sneha Menon', '6543876543'),
('Rohit Joshi', '5432765434');

-- Route Table
INSERT INTO Route (RouteID, StartLocation, EndLocation, IntermediateLocations) VALUES
(101, 'IITGN', 'Ahmedabad Airport', 'Chandkheda, Motera'),
(102, 'IITGN', 'Gandhinagar Sector 16', 'PDPU, Sargasan'),
(103, 'IITGN', 'Kalupur Railway Station', 'Infocity, Naroda'),
(104, 'IITGN', 'Vishwakarma Government Engineering College', 'Sabarmati, RTO Circle'),
(105, 'IITGN', 'NID', 'Paldi, Ashram Road'),
(201, 'Ahmedabad Airport', 'IITGN', 'Motera, Chandkheda'),
(202, 'Gandhinagar Sector 16', 'IITGN', 'Sargasan, PDPU'),
(203, 'Kalupur Railway Station', 'IITGN', 'Naroda, Infocity'),
(204, 'Vishwakarma Government Engineering College', 'IITGN', 'RTO Circle, Sabarmati'),
(205, 'NID', 'IITGN', 'Ashram Road, Paldi');

-- Schedule Table
INSERT INTO Schedule (BusID, DriverID, RouteID, StartTime, EndTime, DepartureDay) VALUES
(1, 1, 101, '07:00:00', '08:30:00', '2025-03-01'),
(2, 2, 102, '08:00:00', '09:00:00', '2025-03-01'),
(3, 3, 103, '09:00:00', '10:30:00', '2025-03-01'),
(4, 4, 104, '10:00:00', '11:00:00', '2025-03-01'),
(5, 5, 105, '11:00:00', '12:30:00', '2025-03-01'),
(6, 6, 201, '17:00:00', '18:30:00', '2025-03-01'),
(7, 7, 202, '18:00:00', '19:00:00', '2025-03-01'),
(8, 8, 203, '19:00:00', '20:30:00', '2025-03-01'),
(9, 9, 204, '20:00:00', '21:00:00', '2025-03-01'),
(10, 10, 205, '21:00:00', '22:30:00', '2025-03-01'),
(1, 2, 101, '07:30:00', '09:00:00', '2025-03-02'),
(2, 3, 102, '08:30:00', '09:30:00', '2025-03-02');

-- Bookings Table
INSERT INTO Bookings (JourneyID, UserID, Seat) VALUES
(1, 1, 10),
(2, 2, 15),
(3, 3, 20),
(4, 4, 25),
(5, 5, 30),
(6, 6, 5),
(7, 7, 12),
(8, 8, 18),
(9, 9, 22),
(10, 10, 35),
(1, 11, 8),
(2, 12, 14),
(3, 13, 21),
(4, 14, 27),
(5, 15, 33);

-- Boarding Table
INSERT INTO Boarding (BookingID, JourneyID, JourneyDate, Boarded) VALUES
(1, 1, '2025-03-01', TRUE),
(2, 2, '2025-03-01', TRUE),
(3, 3, '2025-03-01', FALSE),
(4, 4, '2025-03-01', TRUE),
(5, 5, '2025-03-01', FALSE),
(6, 6, '2025-03-01', TRUE),
(7, 7, '2025-03-01', TRUE),
(8, 8, '2025-03-01', FALSE),
(9, 9, '2025-03-01', TRUE),
(10, 10, '2025-03-01', TRUE),
(11, 1, '2025-03-02', TRUE),
(12, 2, '2025-03-02', FALSE),
(13, 3, '2025-03-02', TRUE);

-- LiveLocation Table
INSERT INTO LiveLocation (BusID, Latitude, Longitude, LastUpdatedTime) VALUES
(1, 23.05, 72.58, '07:15:00'),
(2, 23.21, 72.64, '08:10:00'),
(3, 23.00, 72.50, '09:20:00'),
(4, 23.10, 72.55, '10:15:00'),
(5, 23.15, 72.60, '11:25:00'),
(6, 1.05, 2.58, '17:15:00'),
(7, 2.21, 2.64, '18:10:00'),
(8, 3.00, 2.50, '19:20:00'),
(9, 4.10, 2.55, '20:15:00'),
(10, 5.15, 2.60, '21:25:00');

-- Penalty Table
INSERT INTO Penalty (UserID, NumberOfMisses, PenaltyAmount, PenaltyDate) VALUES
(1, 2, 50, '2025-02-25'),
(3, 1, 25, '2025-02-25'),
(5, 3, 75, '2025-02-25'),
(7, 1, 25, '2025-02-26'),
(9, 2, 50, '2025-02-26'),
(11, 4, 100, '2025-02-26'),
(2, 1, 25, '2025-02-27'),
(4, 2, 50, '2025-02-27'),
(6, 3, 75, '2025-02-27'),
(8, 1, 25, '2025-02-28');

-- Authorities Table
INSERT INTO Authorities (Name, Email, Password) VALUES
('Admin One', 'admin1@example.com', 'password123'),
('Admin Two', 'admin2@example.com', 'securepass'),
('Support Staff', 'support@example.com', 'helpline');

-- Feedback Table
INSERT INTO Feedback (UserID, BusID, FeedbackText, Rating, FeedbackDate) VALUES
(1, 1, 'Comfortable ride, but bus was late.', 4, '2025-02-28'),
(2, 2, 'Excellent service, on time and clean.', 5, '2025-02-28'),
(3, 3, 'The driver was very helpful.', 4, '2025-02-27'),
(4, 4, 'Too crowded, need more buses.', 3, '2025-02-27'),
(5, 5, 'Good experience overall.', 4, '2025-02-26'),
(6, 1, 'Uncomfortable seats.', 2, '2025-02-26'),
(7, 2, 'AC was not working.', 1, '2025-02-25'),
(8, 3, 'Safe and reliable.', 5, '2025-02-25'),
(9, 4, 'Bus stopped too frequently.', 3, '2025-02-24'),
(10, 5, 'Pleasant journey.', 4, '2025-02-24');

-- Tickets Table
INSERT INTO Tickets (TicketID, BookingID, Departure_Date, StartTime, EndTime, SeatNumber) VALUES
('TKT001', 1, '2025-03-01', '07:00:00', '08:30:00', 10),
('TKT002', 2, '2025-03-01', '08:00:00', '09:00:00', 15),
('TKT003', 3, '2025-03-01', '09:00:00', '10:30:00', 20),
('TKT004', 4, '2025-03-01', '10:00:00', '11:00:00', 25),
('TKT005', 5, '2025-03-01', '11:00:00', '12:30:00', 30),
('TKT006', 6, '2025-03-01', '17:00:00', '18:30:00', 5),
('TKT007', 7, '2025-03-01', '18:00:00', '19:00:00', 12),
('TKT008', 8, '2025-03-01', '19:00:00', '20:30:00', 18),
('TKT009', 9, '2025-03-01', '20:00:00', '21:00:00', 22),
('TKT010', 10, '2025-03-01', '21:00:00', '22:30:00', 35),
('TKT011', 11, '2025-03-02', '07:00:00', '08:30:00', 8),
('TKT012', 12, '2025-03-02', '08:00:00', '09:00:00', 14);

