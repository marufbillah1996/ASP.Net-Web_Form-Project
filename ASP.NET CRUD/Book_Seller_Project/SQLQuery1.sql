CREATE TABLE Authors
(
	AuthorID INT IDENTITY PRIMARY KEY,
	AuthorName VARCHAR(30) NOT NULL,
	AuAddress VARCHAR(30) NULL,
	Picture NVARCHAR(150) NOT NULL
)
GO
CREATE TABLE Genres
(
	GenreID INT IDENTITY PRIMARY KEY,
	GenreName NVARCHAR(30) NOT NULL
)
GO
CREATE TABLE Publishers
(
	PublisherID INT IDENTITY PRIMARY KEY,
	PublisherName VARCHAR(30) NOT NULL
)
GO
CREATE TABLE Books
(
	BookID INT IDENTITY PRIMARY KEY ,
	Title VARCHAR(30) NOT NULL,
	GenreID INT REFERENCES Genres (GenreID),
	Price MONEY NOT NULL,
	PublishDateNo DATE NULL,
	Available BIT NOT NULL,
	PublisherID INT REFERENCES Publishers(PublisherID)
)
GO
CREATE TABLE BookAuthors
(
	AuthorID INT REFERENCES Authors(AuthorID),
	BookID INT REFERENCES Books(BookID),
	PRIMARY KEY (AuthorID,BookID)
)
GO
CREATE TABLE Customers
(
	CustomersID INT IDENTITY PRIMARY KEY,
	CustomersName VARCHAR(30) NOT NULL
)
GO
CREATE TABLE Sales
(
	SaleID INT IDENTITY PRIMARY KEY,
	CustomersID INT REFERENCES Customers (CustomersID)
)
GO
CREATE TABLE SalesDetails
(
	SalesID INT REFERENCES Sales(SaleID),
	BookID INT REFERENCES Books(BookID),
	NumberOfStock  INT NOT NULL,
	PRIMARY KEY (SalesID,BookID)
)
GO