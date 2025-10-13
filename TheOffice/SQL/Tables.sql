/* ===============================================
			Tablas de Dimension
   =============================================== */

CREATE TABLE Sellers
(IdSeller text PRIMARY KEY,
SellerName text);

CREATE TABLE Segment
(IdSegment text PRIMARY KEY,
Segment text);

CREATE TABLE Region
(PostalCode text PRIMARY KEY,
Country text,
City text,
States text,
Region text);

CREATE TABLE Product
(IdProduct text PRIMARY KEY,
ProductName text,
Category text,
SubCategory text);

CREATE TABLE Ship
(IdShip text PRIMARY KEY,
ShipMode text);

CREATE TABLE Customers
(IdCustomer text PRIMARY KEY,
CustomerName text);

CREATE TABLE Calendario
(Date date PRIMARY KEY,	
DateAsInteger text,	
Year text,	
Monthnumber text,	
YearMonthnumber text,	
YearMonthname text,
MonthNameShort text,
MonthNameLong text,
DayOfWeekNumber text,
DayOfWeek text,
Day text,
Quarter text,
YearQuarter text
);

/* ===============================================
		Tablas de Hechos
   =============================================== */

CREATE TABLE Sales 
(IdOrder text REFERENCES FactTransaction(IdOrder),
IdProduct text REFERENCES Product(IdProduct),
Sales NUMERIC(10,5),
Quantity int,
Discount NUMERIC(10,5),
Profit NUMERIC(10,5));

CREATE TABLE FactTransaction
(IdOrder text PRIMARY KEY,
IdCustomer text REFERENCES Customers(IdCustomer),
IdSeller text REFERENCES Sellers(IdSeller),
OrderDate date REFERENCES Calendario(Date),
ShipDate date,
PostalCode text REFERENCES Region(PostalCode),
IdShip text REFERENCES Ship(IdShip),
IdSegment text REFERENCES Segment(IdSegment),
Returned text);


ALTER TABLE FactTransaction
ADD CONSTRAINT fk_fecha
FOREIGN KEY (OrderDate)
REFERENCES Calendario(Date);-- Se agrega una relcion entre T.Calendario y T.FactTransaction