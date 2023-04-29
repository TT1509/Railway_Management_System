

-- SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS Train;
DROP TABLE IF EXISTS Passenger;
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Route;
DROP TABLE IF EXISTS Schedule_Table;
DROP TABLE IF EXISTS Station;
DROP TABLE IF EXISTS Track;
DROP TABLE IF EXISTS Form;
DROP TABLE IF EXISTS Involve;

Create table Train (
	Train_ID INT PRIMARY KEY,
    Train_Name VARCHAR(50),
    Total_seats INT
);
    
INSERT INTO Train ( Train_ID, Train_Name, Total_seats)
VALUES
    ( 01, "Clansman", 90),
    ( 02, "Comet", 80),
    ( 03, "Cornish Riviera Express", 100);
    


Create TABLE Passenger (
     Passenger_ID INT,
     Passenger_name VARCHAR(100),
     Date_of_birth DATE,
     Gender VARCHAR(10),
     Train_ID INT,
     CONSTRAINT Passenger_Train FOREIGN KEY (Train_ID) REFERENCES Train (Train_ID)
); 

INSERT INTO Passenger ( Passenger_ID, Passenger_name, Date_of_birth, Gender, Train_ID)
VALUES
     ( 10100, "Ten", "1990-12-03", "Male", 01),
     ( 10200, "MiMi", "1980-04-17", "Female", 02),
     ( 10300, "Nat", "1995-04-30", "Male", 03),
     ( 10400, "Jing", "2000-02-22", "Female", 01);
    
CREATE INDEX idx_passenger_id ON passenger (passenger_id);
     
Create Table Ticket (
	Ticket_No INT,
	_Date_ DATE,
	Seat_Number INT,
	From_station VARCHAR(100),
	To_station VARCHAR(100),
	Train_ID INT,
	CONSTRAINT Ticket_Train FOREIGN KEY (Train_ID) REFERENCES Train (Train_ID),
	Passenger_ID INT,
    CONSTRAINT Ticket_Passenger FOREIGN KEY (Passenger_ID) REFERENCES Passenger (Passenger_ID)
);

INSERT INTO Ticket ( Ticket_No , _Date_ , Seat_Number, From_station, To_station, Train_ID, Passenger_ID)
Values
    (001, "2023-04-28", 45, "London Waterloo", "Stratford", 01, 10100),
    (002, "2023-04-30", 78, "London Victoria", "London Brigde", 02, 10200),
    (003, "2023-10-12", 55, "London Liverpool Street", "London Waterloo", 03, 10300),
    (004, "2023-10-20", 34, "Stratford", "London Victoria", 01, 10100),
    (005, "2023-09-05", 66, "London Brigde", "London Liverpool Street", 02, 10200);
      


Create Table Schedule_Table (
	Schedule_ID INT,
    Start_time TIME,
    End_time TIME,
    Start_place VARCHAR(100),
    Destination VARCHAR(100),
    Train_ID INT,
    Route_ID VARCHAR(20),
    CONSTRAINT Schedule_Table PRIMARY KEY (Schedule_ID, Train_id),
    CONSTRAINT Schedule_Train FOREIGN KEY (Train_ID) REFERENCES Train (Train_ID),
    CONSTRAINT Schedule_Route FOREIGN KEY (Route_ID) REFERENCES Route (Route_ID)
 );
 
 INSERT INTO Schedule_Table (Schedule_ID, Start_time, End_time, Start_place, Destination, Train_ID, Route_ID)
 VALUES
	 ( 01, "05:00", "20:30", "Manchester", "Liverpool", 02, "A1"),
     ( 02, "05:00", "21:30","London", "Glasgow", 02, "A2"),
     ( 03, "06:00", "21:15", "Bristol", "Manchester", 01, "B1"),
     ( 04, "06:30", "22:00", "Glasgow", "Bristol", 03, "B2"),
     ( 05, "06:00", "23:15", "Liverpool", "London", 03, "B3");
    
 Create Table Station (
     Station_ID INT PRIMARY KEY,
     Station_Name VARCHAR(50),
     Location VARCHAR(50)
);
INSERT INTO Station (Station_ID, Station_Name, Location)
VALUES
	 ( 01, "A", "Manchester"),
     ( 02, "B", "London"),
     ( 03, "C", "Bristol"),
     ( 04, "D", "Glasgow"),
     ( 05, "E", "Liverpool");
    
 Create Table Track (
     Track_No INT PRIMARY KEY,
     Length_Km INT
);
INSERT INTO Track (Track_No, Length_Km)
VALUES
    ( 01, 100),
    ( 02, 82),
    ( 03, 50),
    ( 04, 77),
    ( 05, 68);


CREATE TABLE Involve(
	Route_ID VARCHAR(20),
    Station_ID INT,
    PRIMARY KEY ( Route_ID, Station_ID),
    FOREIGN KEY (Route_ID) REFERENCES Route (Route_ID),
    FOREIGN KEY (Station_ID) REFERENCES Station(Station_ID)
);

INSERT INTO Involve (Route_ID, Station_ID)
VALUES
    ( "A1", 01),
    ( "A2", 02),
    ( "B1", 02),
    ( "B2", 03),
    ( "B3", 03),
    ( "A1", 04),
    ( "A2", 04),
    ( "B3", 05);

 
Create Table Route (
	Route_ID VARCHAR(20) PRIMARY KEY,
    Total_Stops INT,
    Schedule_ID INT,
    CONSTRAINT Route_Schedule FOREIGN KEY (Schedule_ID) REFERENCES Schedule_Table (Schedule_ID)
);

INSERT INTO Route (Route_ID, Total_Stops, Schedule_ID)
VALUES
	( "A1", 4, 01),
    ( "A2", 4, 02),
    ( "B1", 4, 03),
    ( "B2", 4, 04),
	( "B3", 4, 05);


CREATE TABLE Form(
	Route_ID VARCHAR(20),
    Track_No INT,
    PRIMARY KEY ( Route_ID, Track_No),
    FOREIGN KEY (Route_ID) REFERENCES Route (Route_ID),
    FOREIGN KEY (Track_No) REFERENCES Track (Track_No)
);
    
    

