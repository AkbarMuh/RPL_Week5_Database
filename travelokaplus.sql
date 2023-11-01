CREATE DATABASE travelokaplus;
USE travelokaplus;

-- customer
CREATE TABLE Customers (
	Customer_ID INT(10) UNIQUE NOT NULL,
	Customers_Username VARCHAR(100) NOT NULL,
	Customer_Email VARCHAR(100) UNIQUE NOT NULL,
    Customer_Password VARCHAR(100) NOT NULL,
    PRIMARY KEY (Customer_ID)
);
DESCRIBE Customers;

INSERT INTO Customers (Customer_ID, Customers_Username, Customer_Email, Customer_Password)
VALUES
	(1, 'exampleCustomer1', 'example.customer1@blablabla.com', 'customerpassword1'),
    (2, 'exampleCustomer2', 'example.customer2@blablabla.com', 'customerpassword2'),
    (3, 'exampleCustomer3', 'example.customer3@blablabla.com', 'customerpassword3'),
    (4, 'exampleCustomer4', 'example.customer4@blablabla.com', 'customerpassword4'),
    (5, 'exampleCustomer5', 'example.customer5@blablabla.com', 'customerpassword5');

-- bookinghotel
CREATE TABLE BookingHotel (
	BookingHotel_ID INT(10) UNIQUE NOT NULL,
	BookingHotel_Nama VARCHAR(100) NOT NULL,
	BookingHotel_Location VARCHAR(100) NOT NULL,
    BookingHotel_Harga INT(10) NOT NULL,
    PRIMARY KEY (BookingHotel_ID)
);
DESCRIBE BookingHotel;

INSERT INTO BookingHotel (BookingHotel_ID, BookingHotel_Nama, BookingHotel_Location, BookingHotel_Harga)
VALUES
	(1, 'exampleBookingHotel1', 'BookingHotelLocationExample1', 10000000),
    (2, 'exampleBookingHotel2', 'BookingHotelLocationExample2', 20000000),
    (3, 'exampleBookingHotel3', 'BookingHotelLocationExample3', 30000000),
    (4, 'exampleBookingHotel4', 'BookingHotelLocationExample4', 40000000),
    (5, 'exampleBookingHotel5', 'BookingHotelLocationExample5', 50000000);

-- bookingtransport
CREATE TABLE BookingTransport (
	BookingTransport_ID INT(10) UNIQUE NOT NULL,
	BookingTransport_Type VARCHAR(100) NOT NULL,
    BookingTransport_Harga INT(10) NOT NULL,
    PRIMARY KEY (BookingTransport_ID)
);
DESCRIBE BookingTransport;

INSERT INTO BookingTransport (BookingTransport_ID, BookingTransport_Type, BookingTransport_Harga)
VALUES
	(1, 'exampleBookingTransportType1', 1000000),
    (2, 'exampleBookingTransportType2', 2000000),
    (3, 'exampleBookingTransportType3', 3000000),
    (4, 'exampleBookingTransportType4', 4000000),
    (5, 'exampleBookingTransportType5', 5000000);

-- attractions
CREATE TABLE Attractions (
	Attraction_ID INT(10) UNIQUE NOT NULL,
    Attraction_NamaAtraksi VARCHAR(100) NOT NULL,
    Attraction_NamaCity VARCHAR(100) NOT NULL,
    Attraction_HargaTiket INT(10) NOT NULL,
    PRIMARY KEY (Attraction_ID)
);
DESCRIBE Attractions;

INSERT INTO Attractions (Attraction_ID, Attraction_NamaAtraksi, Attraction_NamaCity, Attraction_HargaTiket)
VALUES
	(1, 'exampleAttractionNamaAtraksi1', 'exampleAttractionNamaCity1', 1000000),
    (2, 'exampleAttractionNamaAtraksi2', 'exampleAttractionNamaCity2', 2000000),
    (3, 'exampleAttractionNamaAtraksi3', 'exampleAttractionNamaCity3', 3000000),
    (4, 'exampleAttractionNamaAtraksi4', 'exampleAttractionNamaCity4', 4000000),
    (5, 'exampleAttractionNamaAtraksi5', 'exampleAttractionNamaCity5', 5000000);

-- tourpackages
CREATE TABLE TourPackages (
	TourPackage_ID INT(10) UNIQUE NOT NULL,
    BookingHotel_ID INT(10) UNIQUE NOT NULL,
    BookingTransport_ID INT(10) UNIQUE NOT NULL,
    Attraction_ID INT(10) UNIQUE NOT NULL,
    TourPackage_Harga INT(10) NOT NULL,
    PRIMARY KEY (TourPackage_ID),
    CONSTRAINT FK_BookingHotelTour FOREIGN KEY(BookingHotel_ID) REFERENCES BookingHotel(BookingHotel_ID),
	CONSTRAINT FK_BookingTransportTour FOREIGN KEY(BookingTransport_ID) REFERENCES BookingTransport(BookingTransport_ID),
	CONSTRAINT FK_AttractionTour FOREIGN KEY(Attraction_ID) REFERENCES Attractions(Attraction_ID)
);
DESCRIBE TourPackages;

INSERT INTO TourPackages (TourPackage_ID, BookingHotel_ID, BookingTransport_ID, Attraction_ID, TourPackage_Harga)
VALUES
	(1, 1, 1, 1, 1000000),
    (2, 2, 2, 2, 2000000),
    (3, 3, 3, 3, 3000000),
    (4, 4, 4, 4, 4000000),
    (5, 5, 5, 5, 5000000);

-- payment
CREATE TABLE Payments (
	Payment_ID INT(10) UNIQUE NOT NULL,
    TourPackage_ID INT(10) UNIQUE NOT NULL,
	Payment_Method VARCHAR(30) NOT NULL,
    PRIMARY KEY (Payment_ID),
    CONSTRAINT FK_TourPackagePayment FOREIGN KEY(TourPackage_ID) REFERENCES TourPackages(TourPackage_ID)
);
DESCRIBE Payments;

INSERT INTO Payments (Payment_ID, TourPackage_ID, Payment_Method)
VALUES
	(1, 1, 'examplePaymentMethod1'),
    (2, 2, 'examplePaymentMethod2'),
    (3, 3, 'examplePaymentMethod3'),
    (4, 4, 'examplePaymentMethod4'),
    (5, 5, 'examplePaymentMethod5');

-- travelagents
CREATE TABLE TravelAgents (
	TravelAgent_ID INT(10) UNIQUE NOT NULL,
	TourPackage_ID INT(10) UNIQUE NOT NULL,
    TravelAgent_Contact INT(10) NOT NULL,
    PRIMARY KEY (TravelAgent_ID),
    CONSTRAINT FK_TourPackageTravel FOREIGN KEY(TourPackage_ID) REFERENCES TourPackages(TourPackage_ID)
);
DESCRIBE TravelAgents;

INSERT INTO TravelAgents (TravelAgent_ID, TourPackage_ID, TravelAgent_Contact)
VALUES
	(1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);


-- DROP DATABASE travelokaplus;

SELECT * FROM Customers;
SELECT * FROM BookingHotel;
SELECT * FROM BookingTransport;
SELECT * FROM Payments;
SELECT * FROM TourPackages;
SELECT * FROM TravelAgents;
SELECT * FROM Attractions;