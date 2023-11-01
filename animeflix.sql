CREATE DATABASE animeflix;
USE animeflix;

-- customers
CREATE TABLE IF NOT EXISTS Customers(
	Customer_ID CHAR(10) UNIQUE NOT NULL,
    Customer_Username VARCHAR(50),
    Customer_Email VARCHAR(50),
    Customer_Password VARCHAR(50),
    PRIMARY KEY (Customer_ID)
);

DESCRIBE Customers;

INSERT INTO Customers (Customer_ID, Customer_Username, Customer_Email, Customer_Password)
VALUES
    ('CUST000001', 'exampleCustomer1', 'example.customer1@blablabla.com', 'customerpassword1'),
    ('CUST000002', 'exampleCustomer2', 'example.customer2@blablabla.com', 'customerpassword2'),
    ('CUST000003', 'exampleCustomer3', 'example.customer3@blablabla.com', 'customerpassword3'),
    ('CUST000004', 'exampleCustomer4', 'example.customer4@blablabla.com', 'customerpassword4'),
    ('CUST000005', 'exampleCustomer5', 'example.customer5@blablabla.com', 'customerpassword5');
    
-- admin
CREATE TABLE IF NOT EXISTS Admins(
	Admin_ID CHAR(5) UNIQUE NOT NULL,
    Admin_Username VARCHAR(50),
    Admin_Email VARCHAR(50),
    Admin_Password VARCHAR(50),
    PRIMARY KEY (Admin_ID)
);

DESCRIBE Admins;

INSERT INTO Admins (Admin_ID, Admin_Username, Admin_Email, Admin_Password)
VALUES
	('AD001', 'exampleAdmin1', 'example.admin1@blablabla.com', 'adminpassword1'),
    ('AD002', 'exampleAdmin2', 'example.admin2@blablabla.com', 'adminpassword2'),
    ('AD003', 'exampleAdmin3', 'example.admin3@blablabla.com', 'adminpassword3'),
    ('AD004', 'exampleAdmin4', 'example.admin4@blablabla.com', 'adminpassword4'),
    ('AD005', 'exampleAdmin5', 'example.admin5@blablabla.com', 'adminpassword5');
    
-- subcription
CREATE TABLE IF NOT EXISTS Subscriptions(
	Subscription_ID CHAR(10) UNIQUE NOT NULL,
    Customer_ID CHAR(10) UNIQUE NOT NULL,
    Subscription_Type VARCHAR(50),
    Subscription_Cost INT(50),
    PRIMARY KEY (Subscription_ID),
    CONSTRAINT FK_CustomerSubs FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

DESCRIBE Subscriptions;

INSERT INTO Subscriptions (Subscription_ID, Customer_ID, Subscription_Type, Subscription_Cost)
VALUES
	('SUBS000001', 'CUST000001', 'exampleSubscriptionType1', 100000),
    ('SUBS000002', 'CUST000002', 'exampleSubscriptionType2', 200000),
    ('SUBS000003', 'CUST000003', 'exampleSubscriptionType3', 300000),
    ('SUBS000004', 'CUST000004', 'exampleSubscriptionType4', 400000),
    ('SUBS000005', 'CUST000005', 'exampleSubscriptionType5', 500000);
    
-- payment
CREATE TABLE IF NOT EXISTS Payments(
	Payment_ID CHAR(10) UNIQUE NOT NULL,
    Customer_ID CHAR(10) UNIQUE NOT NULL,
	Subscription_ID CHAR(10) UNIQUE NOT NULL,
    Payment_TotalCost INT(50),
    Payment_Method VARCHAR(50),
    PRIMARY KEY (Payment_ID),
    CONSTRAINT FK_CustomerPays FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    CONSTRAINT FK_SubscriptionPays FOREIGN KEY (Subscription_ID) REFERENCES Subscriptions(Subscription_ID)
);

DESCRIBE Payments;

INSERT INTO Payments (Payment_ID, Customer_ID, Subscription_ID, Payment_TotalCost, Payment_Method)
VALUES
	('PAYMNT0001', 'CUST000001', 'SUBS000001',  1111111, 'examplePaymentMethod1'),
    ('PAYMNT0002', 'CUST000002', 'SUBS000002',  2222222, 'examplePaymentMethod2'),
    ('PAYMNT0003', 'CUST000003', 'SUBS000003',  3333333, 'examplePaymentMethod3'),
    ('PAYMNT0004', 'CUST000004', 'SUBS000004',  4444444, 'examplePaymentMethod4'),
    ('PAYMNT0005', 'CUST000005', 'SUBS000005',  5555555, 'examplePaymentMethod5');
    
-- comment
CREATE TABLE IF NOT EXISTS Comments(
	Comment_ID CHAR(10) UNIQUE NOT NULL,
    Customer_ID CHAR(10) UNIQUE NOT NULL,
	Admin_ID CHAR(5) UNIQUE NOT NULL,
    Comment_Value TEXT,
    Comment_TimeStamp TIMESTAMP,
    PRIMARY KEY (Comment_ID),
    CONSTRAINT FK_Customer FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    CONSTRAINT FK_Admin FOREIGN KEY (Admin_ID) REFERENCES Admins(Admin_ID)
);

DESCRIBE Comments;

INSERT INTO Comments (Comment_ID, Customer_ID, Admin_ID, Comment_Value, Comment_TimeStamp)
VALUES
	('COMNT00001', 'CUST000001', 'AD001',  'exampleOfLongCommentsBlaBlaBla1', NOW()),
    ('COMNT00002', 'CUST000002', 'AD002',  'exampleOfLongCommentsBlaBlaBla2', NOW()),
    ('COMNT00003', 'CUST000003', 'AD003',  'exampleOfLongCommentsBlaBlaBla3', NOW()),
    ('COMNT00004', 'CUST000004', 'AD004',  'exampleOfLongCommentsBlaBlaBla4', NOW()),
    ('COMNT00005', 'CUST000005', 'AD005',  'exampleOfLongCommentsBlaBlaBla5', NOW());
    
    
-- anime
CREATE TABLE IF NOT EXISTS Animes(
	Anime_ID CHAR(10) UNIQUE NOT NULL,
    Anime_Title VARCHAR(50),
    Anime_Genre VARCHAR(50),
    Anime_Description TEXT,
    Anime_ReleaseYear CHAR(4),
    Anime_VideoURL VARCHAR(50),
    PRIMARY KEY (Anime_ID)
);

DESCRIBE Animes;

INSERT INTO Animes (Anime_ID, Anime_Title, Anime_Genre, Anime_Description, Anime_ReleaseYear, Anime_VideoURL)
VALUES
	('ANIME00001', 'exampleAnime1', 'exampleGenreAnime1', 'exampleLongDescriptionForAnime1', '2001', 'exampleAnimeVideoURL1'),
    ('ANIME00002', 'exampleAnime2', 'exampleGenreAnime2', 'exampleLongDescriptionForAnime2', '2002', 'exampleAnimeVideoURL2'),
    ('ANIME00003', 'exampleAnime3', 'exampleGenreAnime3', 'exampleLongDescriptionForAnime3', '2003', 'exampleAnimeVideoURL3'),
    ('ANIME00004', 'exampleAnime4', 'exampleGenreAnime4', 'exampleLongDescriptionForAnime4', '2004', 'exampleAnimeVideoURL4'),
    ('ANIME00005', 'exampleAnime5', 'exampleGenreAnime5', 'exampleLongDescriptionForAnime5', '2005', 'exampleAnimeVideoURL5');
    
-- rekomendasi
CREATE TABLE IF NOT EXISTS Rekomendasi(
	Rekomendasi_ID CHAR(10) UNIQUE NOT NULL,
    Anime_ID CHAR(10) UNIQUE NOT NULL,
    Rekomendasi_Title VARCHAR(50),
    Rekomendasi_Genre VARCHAR(50),
    Rekomendasi_Description TEXT,
    Rekomendasi_ReleaseYear CHAR(4),
    Rekomendasi_VideoURL VARCHAR(50),
    PRIMARY KEY (Rekomendasi_ID),
    CONSTRAINT FK_AnimeRekomen FOREIGN KEY (Anime_ID) REFERENCES Animes(Anime_ID)
);

DESCRIBE Rekomendasi;

INSERT INTO Rekomendasi (Rekomendasi_ID, Anime_ID, Rekomendasi_Title, Rekomendasi_Genre, Rekomendasi_Description, Rekomendasi_ReleaseYear, Rekomendasi_VideoURL)
VALUES
	('REKOM00001', 'ANIME00001', 'exampleRekomendasi1', 'exampleGenreRekomendasi1', 'exampleLongDescriptionForRekomendasi1', '2001', 'exampleRekomendasiVideoURL1'),
    ('REKOM00002', 'ANIME00002', 'exampleRekomendasi2', 'exampleGenreRekomendasi2', 'exampleLongDescriptionForRekomendasi2', '2002', 'exampleRekomendasiVideoURL2'),
    ('REKOM00003', 'ANIME00003', 'exampleRekomendasi3', 'exampleGenreRekomendasi3', 'exampleLongDescriptionForRekomendasi3', '2003', 'exampleRekomendasiVideoURL3'),
    ('REKOM00004', 'ANIME00004', 'exampleRekomendasi4', 'exampleGenreRekomendasi4', 'exampleLongDescriptionForRekomendasi4', '2004', 'exampleRekomendasiVideoURL4'),
    ('REKOM00005', 'ANIME00005', 'exampleRekomendasi5', 'exampleGenreRekomendasi5', 'exampleLongDescriptionForRekomendasi5', '2005', 'exampleRekomendasiVideoURL5');

-- DROP DATABASE animeflix;

SELECT * FROM Customers;
SELECT * FROM Admins;
SELECT * FROM Subscriptions;
SELECT * FROM Payments;
SELECT * FROM Comments;
SELECT * FROM Animes;
SELECT * FROM Rekomendasi;