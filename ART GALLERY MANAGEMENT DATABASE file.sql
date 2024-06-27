Show databases;
#CREATE DATABASE IF NOT EXISTS Art_Gallery_Management;
USE Art_Gallery_Management;
SHOW Tables;


CREATE TABLE IF NOT EXISTS Artists (
    ArtistID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    BirthDate DATE,
    Nationality VARCHAR(255)
);

INSERT INTO Artists (ArtistID, Name, BirthDate, Nationality)
VALUES
    (1, 'Vincent van Gogh', '1853-03-30', 'Dutch'),
    (2, 'Leonardo da Vinci', '1452-04-15', 'Italian'),
    (3, 'Pablo Picasso', '1881-10-25', 'Spanish'),
    (4, 'Georgia OKeeffe', '1887-11-15', 'American'),
    (5, 'Frida Kahlo', '1907-07-06', 'Mexican'),
    (6, 'Salvador Dali', '1904-05-11', 'Spanish'),
    (7, 'Edvard Munch', '1863-12-12', 'Norwegian'),
    (8, 'Jackson Pollock', '1912-01-28', 'American'),
    (9, 'Rembrandt van Rijn', '1606-07-15', 'Dutch'),
    (10, 'Claude Monet', '1840-11-14', 'French');
    



CREATE TABLE IF NOT EXISTS Artworks (
    ArtworkID INT NOT NULL PRIMARY KEY,
    Title VARCHAR(255),
    CreationDate DATE,
    Medium VARCHAR(255),
    Dimensions VARCHAR(50),
    ArtistID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);


-- Sample data
INSERT INTO Artworks (ArtworkID, Title, CreationDate, Medium, Dimensions, ArtistID)
VALUES
    (1, 'Starry Night', '1889-06-19', 'Oil on Canvas', '73.7 cm × 92.1 cm', 1),
    (2, 'Mona Lisa', '1503-03-25', 'Oil on Poplar', '77 cm × 53 cm', 2),
    (3, 'Guernica', '1937-04-26', 'Oil on Canvas', '349 cm × 776 cm', 3),
    (4, 'Black Iris', '1926-06-01', 'Oil on Canvas', '76 cm × 63.5 cm', 4),
    (5, 'The Persistence of Memory', '1931-09-22', 'Oil on Canvas', '24 cm × 33 cm', 6),
    (6, 'Water Lilies', '1919-11-17', 'Oil on Canvas', '200 cm × 200 cm', 7),
    (7, 'Number 1A, 1948', '1948-05-24', 'Oil on Canvas', '172.7 cm × 266.7 cm', 8),
    (8, 'The Scream', '1893-09-11', 'Tempera and Pastel on Cardboard', '91 cm × 73.5 cm', 9),
    (9, 'Campbells Soup', '1961-12-22', 'Acrylic and Silkscreen Ink on Canvas', '51 cm × 41 cm', 10),
    (10, 'The Scream2', '1803-12-01', 'Tempera and Pastel on Cardboard', '90 cm × 63.5 cm', 7);
    



CREATE TABLE Exhibitions (
    ExhibitionID INT PRIMARY KEY,
    Name VARCHAR(255),
    StartDate DATE,
    EndDate DATE
);


-- Sample data
INSERT INTO Exhibitions (ExhibitionID, Name, StartDate, EndDate)
VALUES
    (1, 'Impressionist Masters', '2023-04-01', '2023-06-30'),
    (2, 'Renaissance Revival', '2023-07-15', '2023-09-15'),
    (3, 'Cubist Creations', '2023-10-10', '2023-12-31'),
    (4, 'American Modernists', '2024-02-15', '2024-04-15'),
    (5, 'Surrealist Dreams', '2024-01-15', '2024-03-15'),
    (6, 'Impressionist Landscapes', '2024-05-01', '2024-07-01'),
    (7, 'Abstract Expressionism', '2024-08-15', '2024-10-15'),
    (8, 'Women in Art', '2024-11-01', '2025-01-01'),
    (9, 'Pop Art Extravaganza', '2025-02-15', '2025-04-15'),
    (10, 'Modern Masters', '2025-05-01', '2025-07-01');
    
    
    
 CREATE TABLE GalleryStaff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(255),
    ContactInfo VARCHAR(255),
    Role VARCHAR(50)
);

-- Sample data
INSERT INTO GalleryStaff (StaffID, Name, ContactInfo, Role)
VALUES
    (1, 'John Smith', 'john@example.com', 'Curator'),
    (2, 'Alice Johnson', 'alice@example.com', 'Receptionist'),
    (3, 'Emily Adams', 'emily@example.com', 'Registrar'),
    (4, 'Daniel Lee', 'daniel@example.com', 'Security'),
    (5, 'Laura Martinez', 'laura@example.com', 'Marketing Manager'),
    (6, 'William Turner', 'william@example.com', 'Event Coordinator'),
    (7, 'Olivia Brown', 'olivia@example.com', 'Gallery Attendant'),
    (8, 'Robert Lewis', 'robert@example.com', 'Security Supervisor'),
    (9, 'Sophia Johnson', 'sophia@example.com', 'Maintenance'),
    (10, 'Ethan Wilson', 'ethan@example.com', 'Educational Programs');
    


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    ContactInfo VARCHAR(255)
);

-- Sample data
INSERT INTO Customers (CustomerID, Name, ContactInfo)
VALUES
    (1, 'Sarah Davis', 'sarah@example.com'),
    (2, 'Michael Wilson', 'michael@example.com'),
    (3, 'Jessica Turner', 'jessica@example.com'),
    (4, 'Robert White', 'robert@example.com'),
    (5, 'Liam Anderson', 'liam@example.com'),
    (6, 'Ava Garcia', 'ava@example.com'),
    (7, 'Henry White', 'henry@example.com'),
    (8, 'Olivia Baker', 'olivia@example.com'),
    (9, 'Noah King', 'noah@example.com'),
    (10, 'Emma Harris', 'emma@example.com');
    
    

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleDate DATE,
    ArtworkID INT,
    CustomerID INT,
    SalePrice DECIMAL(10, 2),
    FOREIGN KEY (ArtworkID) REFERENCES Artworks(ArtworkID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Sample data
INSERT INTO Sales (SaleID, SaleDate, ArtworkID, CustomerID, SalePrice)
VALUES
    (1, '2023-05-15', 1, 1, 25000.00),
    (2, '2023-08-20', 2, 2, 50000.00),
    (3, '2023-09-01', 2, 3, 7500.00),
    (4, '2023-11-20', 4, 4, 18000.00),
    (5, '2024-02-05', 5, 5, 12000.00),
    (6, '2024-03-10', 6, 6, 8500.00),
    (7, '2024-05-20', 7, 7, 32000.00),
    (8, '2024-06-15', 8, 8, 15000.00),
    (9, '2024-09-01', 9, 9, 20000.00),
    (10, '2025-06-05', 10, 10, 7500.00);
    
    

CREATE TABLE ArtworkCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255),
    Description TEXT
);

-- Sample data
INSERT INTO ArtworkCategories (CategoryID, CategoryName, Description)
VALUES
    (1, 'Impressionism', 'Artworks emphasizing the effect of light and color'),
    (2, 'Renaissance', 'Artworks from the European Renaissance period'),
    (3, 'Cubism', 'Art movement that emphasizes geometric shapes and abstract forms'),
    (4, 'Modernism', 'Artworks that reject traditional styles in favor of innovation'),
    (5, 'Surrealism', 'Art movement that explores dreamlike and irrational imagery'),
    (6, 'Landscape Art', 'Artworks depicting natural scenery and environments'),
    (7, 'Abstract Expressionism', 'Non-representational art emphasizing emotion and spontaneity'),
    (8, 'Women Artists', 'Art by female artists throughout history'),
    (9, 'Pop Art', 'Art that incorporates popular culture and consumer goods'),
    (10, 'Photorealism', 'Art that closely resembles high-resolution photography');
    
    

CREATE TABLE ExhibitionArtworkMapping (
    ExhibitionID INT,
    ArtworkID INT,
    PRIMARY KEY (ExhibitionID, ArtworkID),
    FOREIGN KEY (ExhibitionID) REFERENCES Exhibitions(ExhibitionID),
    FOREIGN KEY (ArtworkID) REFERENCES Artworks(ArtworkID)
);

-- Sample data
INSERT INTO ExhibitionArtworkMapping (ExhibitionID, ArtworkID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
    
    
    
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    TransactionType VARCHAR(50),
    TransactionDate DATE,
    Amount DECIMAL(10, 2)
);

-- Sample data
INSERT INTO Transactions (TransactionID, TransactionType, TransactionDate, Amount)
VALUES
    (1, 'Expense', '2023-05-10', -1000.00),
    (2, 'Income', '2023-08-25', 5000.00),
    (3, 'Expense', '2023-09-15', -2500.00),
    (4, 'Income', '2023-10-05', 8500.00),
    (5, 'Expense', '2024-01-10', -3500.00),
    (6, 'Income', '2024-02-20', 12500.00),
    (7, 'Expense', '2024-04-05', -4500.00),
    (8, 'Income', '2024-05-10', 18000.00),
    (9, 'Income', '2024-07-15', 9500.00),
    (10, 'Income', '2025-05-10', 4200.00);
    
    
    

CREATE TABLE GallerySpaces (
    SpaceID INT PRIMARY KEY,
    SpaceName VARCHAR(255),
    Capacity INT
);

-- Sample data
INSERT INTO GallerySpaces (SpaceID, SpaceName, Capacity)
VALUES
    (1, 'Main Hall', 100),
    (2, 'Small Gallery', 30),
    (3, 'Sculpture Garden', 50),
    (4, 'Annex Gallery', 40),
    (5, 'Sculpture Gallery', 40),
    (6, 'Modern Art Wing', 80),
    (7, 'Prints and Drawings', 30),
    (8, 'Education Room', 25),
    (9, 'Outdoor Patio', 60),
    (10, 'Sculpture Courtyard', 50);
    
    

CREATE TABLE ExhibitionArtworkSchedule (
    ExhibitionID INT,
    ArtworkID INT,
    ScheduleDate DATE,
    PRIMARY KEY (ExhibitionID, ArtworkID, ScheduleDate),
    FOREIGN KEY (ExhibitionID) REFERENCES Exhibitions(ExhibitionID),
    FOREIGN KEY (ArtworkID) REFERENCES Artworks(ArtworkID)
);

-- Sample data for ExhibitionArtworkSchedule table
INSERT INTO ExhibitionArtworkSchedule (ExhibitionID, ArtworkID, ScheduleDate)
VALUES
    (1, 1, '2024-02-15'),
    (2, 2, '2024-03-20'),
    (3, 3, '2024-05-10'),
    (4, 4, '2024-07-05'),
    (5, 5, '2024-08-15'),
    (6, 6, '2024-09-20'),
    (7, 7, '2024-11-10'),
    (8, 8, '2024-12-05'),
    (9, 9, '2025-02-15'),
    (10, 10, '2025-03-15');




CREATE TABLE ExhibitionStaffAssignment (
    ExhibitionID INT,
    StaffID INT,
    AssignmentDate DATE,
    PRIMARY KEY (ExhibitionID, StaffID, AssignmentDate),
    FOREIGN KEY (ExhibitionID) REFERENCES Exhibitions(ExhibitionID),
    FOREIGN KEY (StaffID) REFERENCES GalleryStaff(StaffID)
);

-- Sample data for ExhibitionStaffAssignment table
INSERT INTO ExhibitionStaffAssignment (ExhibitionID, StaffID, AssignmentDate)
VALUES
    (1, 1, '2024-02-15'),
    (2, 2, '2024-03-20'),
    (3, 3, '2024-05-10'),
    (4, 4, '2024-07-05'),
    (5, 5, '2024-08-15'),
    (6, 6, '2024-09-20'),
    (7, 7, '2024-11-10'),
    (8, 8, '2024-12-05'),
    (9, 9, '2025-02-15'),
    (10, 10, '2025-03-15');



CREATE TABLE ArtworkLoan (
    LoanID INT PRIMARY KEY,
    ArtworkID INT,
    LoanDate DATE,
    ReturnDate DATE,
    LenderID INT,
    FOREIGN KEY (ArtworkID) REFERENCES Artworks(ArtworkID),
    FOREIGN KEY (LenderID) REFERENCES Customers(CustomerID)
);
select * from ArtworkLoan;
-- Sample data for ArtworkLoan table
INSERT INTO ArtworkLoan (LoanID, ArtworkID, LoanDate, ReturnDate, LenderID)
VALUES
    (1, 1, '2024-04-15', '2024-06-15', 5),
    (2, 2, '2024-05-10', '2024-07-10', 6),
    (3, 3, '2024-06-20', '2024-08-20', 7),
    (4, 4, '2024-07-05', '2024-09-05', 8),
    (5, 5, '2024-10-15', '2024-12-15', 1),
    (6, 6, '2024-11-10', '2025-01-10', 2),
    (7, 7, '2024-12-20', '2025-02-20', 3),
    (8, 8, '2025-01-05', '2025-03-05', 4),
    (9, 9, '2025-03-20', '2025-05-20', 5),
    (10, 10, '2025-04-15', '2025-06-15', 6);



CREATE TABLE EmployeeShifts (
    ShiftID INT PRIMARY KEY,
    StaffID INT,
    ShiftDate DATE,
    StartTime TIME,
    EndTime TIME,
    FOREIGN KEY (StaffID) REFERENCES GalleryStaff(StaffID)
);

-- Sample data for EmployeeShifts table
INSERT INTO EmployeeShifts (ShiftID, StaffID, ShiftDate, StartTime, EndTime)
VALUES
    (1, 1, '2024-04-15', '08:00:00', '12:00:00'),
    (2, 2, '2024-04-15', '12:00:00', '16:00:00'),
    (3, 3, '2024-04-15', '16:00:00', '20:00:00'),
    (4, 4, '2024-04-16', '09:00:00', '13:00:00'),
    (5, 5, '2024-10-15', '08:00:00', '12:00:00'),
    (6, 6, '2024-10-15', '12:00:00', '16:00:00'),
    (7, 7, '2024-10-15', '16:00:00', '20:00:00'),
    (8, 8, '2024-10-16', '09:00:00', '13:00:00'),
    (9, 9, '2024-11-01', '10:00:00', '14:00:00'),
    (10, 10, '2024-11-01', '14:00:00', '18:00:00');



CREATE TABLE ExhibitionAttendance (
    AttendanceID INT PRIMARY KEY,
    ExhibitionID INT,
    CustomerID INT,
    CheckInTime DATETIME,
    FOREIGN KEY (ExhibitionID) REFERENCES Exhibitions(ExhibitionID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Sample data for ExhibitionAttendance table
INSERT INTO ExhibitionAttendance (AttendanceID, ExhibitionID, CustomerID, CheckInTime)
VALUES
    (1, 1, 1, '2024-05-01 10:00:00'),
    (2, 1, 2, '2024-05-01 11:30:00'),
    (3, 2, 3, '2024-05-02 09:15:00'),
    (4, 3, 4, '2024-05-03 13:45:00'),
    (5, 5, 1, '2024-10-01 10:00:00'),
    (6, 5, 2, '2024-10-01 11:30:00'),
    (7, 6, 3, '2024-10-02 09:15:00'),
    (8, 7, 4, '2024-10-03 13:45:00'),
    (9, 8, 5, '2024-11-01 14:30:00'),
    (10, 9, 6, '2024-11-01 15:15:00');




CREATE TABLE ArtworkRestoration (
    RestorationID INT PRIMARY KEY,
    ArtworkID INT,
    RestorationDate DATE,
    Cost DECIMAL(10, 2),
    FOREIGN KEY (ArtworkID) REFERENCES Artworks(ArtworkID)
);

-- Sample data for ArtworkRestoration table
INSERT INTO ArtworkRestoration (RestorationID, ArtworkID, RestorationDate, Cost)
VALUES
    (1, 1, '2024-08-15', 5000.00),
    (2, 2, '2024-08-20', 6000.00),
    (3, 3, '2024-08-25', 4500.00),
    (4, 4, '2024-09-01', 7000.00),
    (5, 5, '2024-12-15', 8000.00),
    (6, 6, '2025-01-10', 9500.00),
    (7, 7, '2025-02-15', 6000.00),
    (8, 8, '2025-03-01', 7500.00),
    (9, 9, '2025-04-05', 6800.00),
    (10, 10, '2025-05-01', 7200.00);





CREATE TABLE Membership (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(255),
    JoinDate DATE,
    MembershipType VARCHAR(50)
);

-- Sample data for Membership table
INSERT INTO Membership (MemberID, MemberName, JoinDate, MembershipType)
VALUES
    (1, 'Jennifer Adams', '2024-03-01', 'Premium'),
    (2, 'Robert Miller', '2024-04-10', 'Standard'),
    (3, 'Emily Turner', '2024-05-15', 'Premium'),
    (4, 'William Brown', '2024-06-20', 'Standard'),
    (5, 'Sophia Wright', '2024-07-01', 'Standard'),
    (6, 'Liam Parker', '2024-08-10', 'Premium'),
    (7, 'Olivia Turner', '2024-09-15', 'Standard'),
    (8, 'Ethan Miller', '2024-10-20', 'Premium'),
    (9, 'Aiden Johnson', '2024-11-25', 'Standard'),
    (10, 'Isabella Davis', '2024-12-30', 'Premium');





CREATE TABLE MembershipRenewal (
    RenewalID INT PRIMARY KEY,
    MemberID INT,
    RenewalDate DATE,
    RenewalAmount DECIMAL(10, 2),
    FOREIGN KEY (MemberID) REFERENCES Membership(MemberID)
);

-- Sample data for MembershipRenewal table
INSERT INTO MembershipRenewal (RenewalID, MemberID, RenewalDate, RenewalAmount)
VALUES
    (1, 1, '2025-03-01', 150.00),
    (2, 2, '2025-04-10', 50.00),
    (3, 3, '2025-05-15', 150.00),
    (4, 4, '2025-06-20', 50.00),
    (5, 5, '2025-07-01', 50.00),
    (6, 6, '2025-08-10', 150.00),
    (7, 7, '2025-09-15', 50.00),
    (8, 8, '2025-10-20', 150.00),
    (9, 9, '2025-11-25', 50.00),
    (10, 10, '2025-12-30', 150.00);




CREATE TABLE ArtworkReviews (
    ReviewID INT PRIMARY KEY,
    ArtworkID INT,
    CustomerID INT,
    ReviewText TEXT,
    Rating INT,
    FOREIGN KEY (ArtworkID) REFERENCES Artworks(ArtworkID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Sample data for ArtworkReviews table
INSERT INTO ArtworkReviews (ReviewID, ArtworkID, CustomerID, ReviewText, Rating)
VALUES
    (1, 1, 1, 'Beautiful masterpiece!', 5),
    (2, 2, 2, 'Incredible detail in this painting.', 4),
    (3, 3, 3, 'A thought-provoking piece of art.', 5),
    (4, 4, 4, 'Interesting use of colors.', 3),
    (5, 5, 5, 'Impressive work of art!', 4),
    (6, 6, 6, 'Captivating painting!', 5),
    (7, 7, 7, 'Great use of colors and composition.', 4),
    (8, 8, 8, 'This artwork speaks to me.', 5),
    (9, 9, 9, 'A unique and thought-provoking piece.', 4),
    (10, 10, 10, 'Absolutely stunning!', 5);





CREATE TABLE ArtworkGalleryLocations (
    LocationID INT PRIMARY KEY,
    ArtworkID INT,
    SpaceID INT,
    PlacementDate DATE,
    FOREIGN KEY (ArtworkID) REFERENCES Artworks(ArtworkID),
    FOREIGN KEY (SpaceID) REFERENCES GallerySpaces(SpaceID)
);
-- Sample data for ArtworkGalleryLocations table
INSERT INTO ArtworkGalleryLocations (LocationID, ArtworkID, SpaceID, PlacementDate)
VALUES
    (1, 1, 1, '2024-02-15'),
    (2, 2, 2, '2024-03-20'),
    (3, 3, 3, '2024-05-10'),
    (4, 4, 4, '2024-07-05'),
    (5, 5, 5, '2024-10-15'),
    (6, 6, 6, '2024-11-20'),
    (7, 7, 7, '2024-12-10'),
    (8, 8, 8, '2025-01-05'),
    (9, 9, 9, '2025-02-15'),
    (10, 10, 10, '2025-03-20');
    
#Procedure1:
DELIMITER //

CREATE PROCEDURE InsertArtist(
    IN artist_id INT,
    IN artist_name VARCHAR(255),
    IN birth_date DATE,
    IN nationality VARCHAR(255)
)
BEGIN
    INSERT INTO Artists (ArtistID, Name, BirthDate, Nationality)
    VALUES (artist_id, artist_name, birth_date, nationality);
END //

DELIMITER ;

-- Call the InsertArtist procedure to insert a new artist
CALL InsertArtist(11, 'Ronaldo', '1970-02-05', 'Portugese');
select * from Artists;

#Procedure2:
DELIMITER //

CREATE PROCEDURE InsertArtwork(
    IN artwork_id INT,
    IN title VARCHAR(255),
    IN creation_date DATE,
    IN medium VARCHAR(255),
    IN dimensions VARCHAR(50),
    IN artist_id INT
)
BEGIN
    INSERT INTO Artworks (ArtworkID, Title, CreationDate, Medium, Dimensions, ArtistID)
    VALUES (artwork_id, title, creation_date, medium, dimensions, artist_id);
END //

DELIMITER ;

-- Call the InsertArtwork procedure to insert a new artwork
CALL InsertArtwork(11, 'Mona Lisa', '1980-07-29', 'Oil on poplar panel', '60 cm x 70 cm', 11);
select * from Artworks; 

#Procedure3:
DELIMITER //

CREATE PROCEDURE InsertGalleryStaff(
    IN staff_id INT,
    IN staff_name VARCHAR(255),
    IN contact_info VARCHAR(255),
    IN role VARCHAR(50)
)
BEGIN
    INSERT INTO GalleryStaff (StaffID, Name, ContactInfo, Role)
    VALUES (staff_id, staff_name, contact_info, role);
END //

DELIMITER ;

-- Call the InsertGalleryStaff procedure to insert a new staff member
CALL InsertGalleryStaff(11, 'John Doe', 'johndoe@example.com', 'Curator');
select * from GalleryStaff;

#Function1:
DELIMITER //

CREATE FUNCTION InsertMembership(
    member_id INT,
    member_name VARCHAR(255),
    join_date DATE,
    membership_type VARCHAR(50)
)
RETURNS INT
deterministic
BEGIN
    INSERT INTO Membership (MemberID, MemberName, JoinDate, MembershipType)
    VALUES (member_id, member_name, join_date, membership_type);
    
    -- Return the number of rows affected (1 for success, 0 for failure)
    RETURN ROW_COUNT();
END //

DELIMITER ;

-- Call the InsertMembership function to insert a new membership record
SELECT InsertMembership(11, 'Cristiano Ronaldo', '2023-11-01', 'Gold');

-- You can use the result in a SELECT statement to see the number of rows affected (1 for success)
SELECT InsertMembership(12, 'Messi', '2023-11-02', 'Silver');
select * from Membership;

#Function2:
DELIMITER //
CREATE FUNCTION GetSpaceName(space_id INT)
RETURNS VARCHAR(255)
deterministic
BEGIN
    DECLARE space_name VARCHAR(255);
    SELECT SpaceName INTO space_name FROM GallerySpaces WHERE SpaceID = space_id;
    RETURN space_name;
END //

DELIMITER ;
SELECT GetSpaceName(10); -- Replace 1 with the specific SpaceID you want to query
select * from GallerySpaces;

#Function3:
DELIMITER //
CREATE FUNCTION GetCustomerData(customer_id INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE customer_data VARCHAR(255);
    SELECT CONCAT(Name, ' - ', ContactInfo) INTO customer_data FROM Customers WHERE CustomerID = customer_id;
    RETURN customer_data;
END //
DELIMITER ;

-- Now you can use the function to retrieve customer data by CustomerID
SELECT GetCustomerData(5); -- Replace 2 with the specific CustomerID you want to query
select * from Customers;

#Trigger1:
DELIMITER //
CREATE TRIGGER CheckExhibitionDates
BEFORE INSERT ON Exhibitions
FOR EACH ROW
BEGIN
    IF NEW.StartDate >= NEW.EndDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: StartDate must be earlier than EndDate';
    END IF;
END //
DELIMITER ;

-- Now, whenever you try to insert or update data in the Exhibitions table, it will enforce that StartDate is earlier than EndDate.
-- Insert a new exhibition with valid dates (StartDate < EndDate)
INSERT INTO Exhibitions (ExhibitionID, Name, StartDate, EndDate)
VALUES (14, 'Valid Exhibition', '2023-04-01', '2023-04-15');

-- Update an existing exhibition with valid dates (StartDate < EndDate)
UPDATE Exhibitions
SET StartDate = '2023-03-01', EndDate = '2023-03-15'
WHERE ExhibitionID = 14;
select * from Exhibitions;

#Trigger2:
DELIMITER //
CREATE TRIGGER CheckSaleData
BEFORE INSERT ON Sales
FOR EACH ROW
BEGIN
    IF NEW.SalePrice < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: SalePrice must be greater than or equal to 0';
    END IF;
    
    IF NEW.SaleDate > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: SaleDate cannot be in the future';
    END IF;
END //
DELIMITER ;
-- Now, you can use the trigger to enforce rules when inserting or updating data in the Sales table.
-- Insert a sale with valid data
INSERT INTO Sales (SaleID, SaleDate, ArtworkID, CustomerID, SalePrice)
VALUES (24, '2023-04-15', 2, 3, 350.00);
select * from Sales;

#Trigger3:
DELIMITER //
CREATE TRIGGER CheckGalleryLocationData
BEFORE INSERT ON ArtworkGalleryLocations
FOR EACH ROW
BEGIN
    IF NEW.PlacementDate > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: PlacementDate cannot be in the future';
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM Artworks WHERE ArtworkID = NEW.ArtworkID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: ArtworkID does not exist in Artworks table';
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM GallerySpaces WHERE SpaceID = NEW.SpaceID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: SpaceID does not exist in GallerySpaces table';
    END IF;
END //
DELIMITER ;
-- Insert a record with valid data (existing ArtworkID, SpaceID, and a PlacementDate in the present or past)
INSERT INTO ArtworkGalleryLocations (LocationID, ArtworkID, SpaceID, PlacementDate)
VALUES (11, 1, 1, '2023-04-15');
select * from ArtworkGalleryLocations;

#Complex Query1:
#Tables Used:
#Artists,
#Artworks,
#Exhibitions
SELECT
    A.Name AS ArtistName,
    A.BirthDate AS ArtistBirthDate,
    A.Nationality AS ArtistNationality,
    AW.Title AS ArtworkTitle,
    AW.CreationDate AS ArtworkCreationDate,
    AW.Medium AS ArtworkMedium,
    AW.Dimensions AS ArtworkDimensions,
    E.Name AS ExhibitionName,
    E.StartDate AS ExhibitionStartDate,
    E.EndDate AS ExhibitionEndDate
FROM Artists AS A
LEFT JOIN Artworks AS AW ON A.ArtistID = AW.ArtistID
LEFT JOIN Exhibitions AS E ON AW.ArtworkID = E.ExhibitionID;

#Complex Query2:
#Tables Used:
#GalleryStaff
#Customers
#Sales
#Artworks
SELECT
    S.SaleID,
    S.SaleDate,
    C.CustomerID,
    C.Name AS CustomerName,
    C.ContactInfo AS CustomerContactInfo,
    A.ArtworkID,
    A.Title AS ArtworkTitle,
    A.Medium AS ArtworkMedium,
    A.Dimensions AS ArtworkDimensions,
    G.Name AS StaffName,
    G.ContactInfo AS StaffContactInfo,
    G.Role AS StaffRole,
    S.SalePrice
FROM Sales AS S
INNER JOIN Customers AS C ON S.CustomerID = C.CustomerID
INNER JOIN Artworks AS A ON S.ArtworkID = A.ArtworkID
INNER JOIN GalleryStaff AS G ON A.ArtistID = G.StaffID;

#Complex Query3:
#Tables Used:
#ArtworkCategories
#ExhibitionArtworkMapping
#Transactions
SELECT
    AC.CategoryID,
    AC.CategoryName,
    AC.Description AS CategoryDescription,
    EAM.ExhibitionID,
    EAM.ArtworkID,
    T.TransactionID,
    T.TransactionType,
    T.TransactionDate,
    T.Amount
FROM ArtworkCategories AS AC
RIGHT JOIN ExhibitionArtworkMapping AS EAM ON AC.CategoryID = EAM.ArtworkID
RIGHT JOIN Transactions AS T ON AC.CategoryID = T.TransactionID;

#Complex Query4:
#Tables Used:
#GallerySpaces
#ExhibitionArtworkSchedule
#ExhibitionStaffAssignment
SELECT
    GS.SpaceID,
    GS.SpaceName,
    GS.Capacity,
    EAS.ExhibitionID,
    EAS.ArtworkID,
    EAS.ScheduleDate,
    ESA.StaffID,
    ESA.AssignmentDate
FROM GallerySpaces GS
CROSS JOIN ExhibitionArtworkSchedule EAS
CROSS JOIN ExhibitionStaffAssignment ESA
WHERE
    GS.SpaceID = EAS.ExhibitionID
    AND EAS.ExhibitionID = ESA.ExhibitionID;
    
#Complex Query5:
#Tables Used:
#ArtworkLoan
#EmployeeShifts
#ExhibitionAttendance
SELECT
    AL.LoanID,
    AL.ArtworkID,
    AL.LoanDate,
    AL.ReturnDate,
    AL.LenderID,
    ES.ShiftID,
    ES.StaffID,
    ES.ShiftDate,
    ES.StartTime,
    ES.EndTime,
    EA.AttendanceID,
    EA.ExhibitionID,
    EA.CustomerID,
    EA.CheckInTime
FROM ArtworkLoan AL
LEFT JOIN EmployeeShifts ES ON AL.LenderID = ES.StaffID
RIGHT JOIN ExhibitionAttendance EA ON AL.LoanID = EA.AttendanceID;

#Complex Query6:
#Tables Used:
#ArtworkRestoration
#Artworks
#Membership
#MembershipRenewal
SELECT
    AR.RestorationID,
    AR.RestorationDate,
    AR.Cost,
    M.MemberName,
    M.JoinDate,
    M.MembershipType,
    MR.RenewalDate,
    MR.RenewalAmount
FROM
    ArtworkRestoration AS AR
JOIN
    Artworks AS A ON AR.ArtworkID = A.ArtworkID
LEFT JOIN
    Membership AS M ON A.ArtistID = M.MemberID
LEFT JOIN
    MembershipRenewal AS MR ON M.MemberID = MR.MemberID
ORDER BY
    AR.RestorationDate DESC;

#Complex Query7:
#Self-Join
#Tables Used:
#ArtworkReviews
#Artworks
#ArtworkGalleryLocations
#Artists
SELECT
    AR.ReviewID,
    AR.ReviewText,
    AR.Rating,
    AG.LocationID,
    AG.PlacementDate,
    A.ArtistID,
    A.Name AS ArtistName,
    A.BirthDate,
    A.Nationality,
    AR2.ReviewID AS RelatedReviewID,
    AR2.ReviewText AS RelatedReviewText,
    AR2.Rating AS RelatedRating
FROM
    ArtworkReviews AS AR
INNER JOIN
    Artworks AS AW ON AR.ArtworkID = AW.ArtworkID
INNER JOIN
    ArtworkGalleryLocations AS AG ON AR.ArtworkID = AG.ArtworkID
INNER JOIN
    Artists AS A ON AW.ArtistID = A.ArtistID
LEFT JOIN
    ArtworkReviews AS AR2 ON AR.ArtworkID = AR2.ArtworkID AND AR.ReviewID <> AR2.ReviewID
ORDER BY
    AR.ReviewID, AR2.ReviewID;
    
#Complex Query8:
#Sub-Queries
#Tables Used:
#Artworks
#ArtworkGalleryLocations
#Exhibitions
#Artists
#ArtworkReviews
#Customers
SELECT
    E.ExhibitionID,
    E.Name AS ExhibitionName,
    E.StartDate,
    E.EndDate,
    A.ArtworkID,
    A.Title AS ArtworkTitle,
    A.CreationDate,
    A.Medium,
    A.Dimensions,
    AR.ArtistID,
    AR.Name AS ArtistName,
    AR.BirthDate,
    AR.Nationality,
    C.CustomerID,
    C.Name AS CustomerName,
    C.ContactInfo,
    (SELECT AVG(ARV1.Rating) FROM ArtworkReviews AS ARV1 WHERE ARV1.ArtworkID = A.ArtworkID) AS AverageRating,
    (SELECT COUNT(AG1.ArtworkID) FROM ArtworkGalleryLocations AS AG1 WHERE AG1.LocationID = E.ExhibitionID) AS TotalArtworksInExhibition
FROM
    Artworks AS A
RIGHT JOIN
    ArtworkGalleryLocations AS AG ON A.ArtworkID = AG.ArtworkID
RIGHT JOIN
    Exhibitions AS E ON AG.LocationID = E.ExhibitionID
LEFT JOIN
    Artists AS AR ON A.ArtistID = AR.ArtistID
LEFT JOIN
    ArtworkReviews AS ARV ON A.ArtworkID = ARV.ArtworkID
LEFT JOIN
    Customers AS C ON ARV.CustomerID = C.CustomerID
ORDER BY
    E.ExhibitionID, A.ArtworkID, C.CustomerID;

#Complex Query9:
#Sub-Queries
#Tables Used:
#ArtworkRestoration
#Artworks
#Artists
#Membership
#ExhibitionAttendance
SELECT
    AR.RestorationID,
    AR.RestorationDate,
    AR.Cost,
    M.MemberID,
    M.MemberName,
    M.JoinDate,
    M.MembershipType,
    EA.AttendanceID,
    EA.ExhibitionID,
    EA.CustomerID,
    EA.CheckInTime,
    (SELECT SUM(AR1.Cost) FROM ArtworkRestoration AS AR1 WHERE AR1.ArtworkID = AW.ArtworkID) AS TotalRestorationCost,
    (SELECT COUNT(EA1.ExhibitionID) FROM ExhibitionAttendance AS EA1 WHERE EA1.CustomerID = M.MemberID) AS TotalExhibitionsAttended
FROM
    ArtworkRestoration AS AR
LEFT JOIN
    Artworks AS AW ON AR.ArtworkID = AW.ArtworkID
LEFT JOIN
    Artists AS A ON AW.ArtistID = A.ArtistID
LEFT JOIN
    Membership AS M ON A.ArtistID = M.MemberID
RIGHT JOIN
    ExhibitionAttendance AS EA ON EA.CustomerID = M.MemberID
ORDER BY
    AR.RestorationDate DESC; 

#Complex Query10:
#Self-Join
#Tables Used:
#ArtworkReviews
#ArtworkLoan
#ExhibitionArtworkMapping
SELECT
    AR1.ReviewID AS ReviewID1,
    AR1.ArtworkID AS ArtworkID1,
    AR1.CustomerID AS CustomerID1,
    AR1.ReviewText AS ReviewText1,
    AR1.Rating AS Rating1,
    AR2.ReviewID AS ReviewID2,
    AR2.ArtworkID AS ArtworkID2,
    AR2.CustomerID AS CustomerID2,
    AR2.ReviewText AS ReviewText2,
    AR2.Rating AS Rating2
FROM
    ArtworkReviews AS AR1
LEFT JOIN
    ArtworkReviews AS AR2 ON AR1.ArtworkID = AR2.ArtworkID AND AR1.ReviewID <> AR2.ReviewID
ORDER BY
    AR1.ArtworkID, AR1.ReviewID, AR2.ReviewID;