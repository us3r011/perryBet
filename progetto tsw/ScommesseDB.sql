DROP database IF EXISTS scommessedb; 
CREATE database scommessedb; 
USE scommessedb;
CREATE TABLE Conto( 
	CodiceConto VARCHAR(15) NOT NULL, 
	Saldo DOUBLE PRECISION NOT NULL, 
	PRIMARY KEY(CodiceConto));
load data local infile '/home/us3r011/Downloads/progetto tsw/popolamento/Conto.sql'
into table Conto LINES TERMINATED BY '\r\n' (CodiceConto,Saldo);
CREATE TABLE Registrato (
	CF CHAR(16) NOT NULL, 
    Nome varchar(30) not null,
    Cognome varchar(30) not null,
	Password VARCHAR(15) NOT NULL, 
	Username VARCHAR(30) NOT NULL,
    Email varchar(50) NOT NULL,
	Città VARCHAR(25)	,
	Indirizzo VARCHAR(20) NOT NULL,
	DataDiNascita DATE NOT NULL, 
	SessionID VARCHAR(15), 
	CodiceConto VARCHAR(15),
    Admin BIT,
	PRIMARY KEY(CF),
	FOREIGN KEY(CodiceConto) REFERENCES Conto(CodiceConto) ON UPDATE CASCADE);
load data local infile '/home/us3r011/Downloads/progetto tsw/popolamento/Registrato.sql'
into table Registrato LINES TERMINATED BY '\r\n' (CF,Password,Username,Email,Città,Indirizzo,DataDiNascita,SessionID,CodiceConto,Admin);
	
CREATE TABLE Visitatore (
	SessionID VARCHAR(15) NOT NULL,
	PRIMARY KEY(SessionID));
load data local infile '/home/us3r011/Downloads/progetto tsw/popolamento/Visitatore.sql'
into table Visitatore LINES TERMINATED BY '\r\n' (SessionID);
CREATE TABLE Prenotazione(
	Cod_prenotazione CHAR(5) NOT NULL,
	Vincita DOUBLE PRECISION, 
	ImportoGiocato INTEGER NOT NULL,
	PRIMARY KEY(Cod_prenotazione));
load data local infile '/home/us3r011/Downloads/progetto tsw/popolamento/Prenotazione.sql'
into table Prenotazione LINES TERMINATED BY '\r\n' (Cod_prenotazione,Vincita,ImportoGiocato);
	
CREATE TABLE Prenota(
	CF CHAR(16), 
	Cod_prenotazione CHAR(5) NOT NULL, 
	SessionID VARCHAR(15),
	DataPrenotazione DATETIME NOT NULL, 
	PRIMARY KEY(Cod_prenotazione) ,
	FOREIGN KEY(CF) REFERENCES Registrato(CF) ON UPDATE CASCADE ,
	FOREIGN KEY(Cod_prenotazione) REFERENCES Prenotazione(Cod_prenotazione) ON UPDATE CASCADE,
	FOREIGN KEY(SessionID) REFERENCES Visitatore(SessionID) ON UPDATE CASCADE);
load data local infile '/home/us3r011/Downloads/progetto tsw/popolamento/Prenota.sql'
into table Prenota LINES TERMINATED BY '\r\n' (CF,Cod_prenotazione,SessionID,DataPrenotazione);

CREATE TABLE Scommessa(
	Cod_scommessa CHAR(5) NOT NULL,
	Vincita DOUBLE PRECISION, 
	Importo INTEGER NOT NULL,
	PRIMARY KEY(Cod_scommessa));
load data local infile '/home/us3r011/Downloads/progetto tsw/popolamento/Scommessa.sql'
into table Scommessa LINES TERMINATED BY '\r\n' (Cod_scommessa,Vincita,Importo);

CREATE TABLE Effettua(
	CF VARCHAR(16), 
	Cod_prenotazione CHAR(5), 
	Cod_Agenzia VARCHAR(10),
	Cod_scommessa CHAR(5) NOT NULL,
	DataScommessa DATETIME NOT NULL, 
	PRIMARY KEY(Cod_scommessa),
	FOREIGN KEY(CF) REFERENCES Registrato(CF) ON UPDATE CASCADE,
	FOREIGN KEY(Cod_prenotazione) REFERENCES Prenotazione(Cod_prenotazione) ON UPDATE CASCADE,
    FOREIGN KEY(Cod_scommessa) 	REFERENCES Scommessa(Cod_scommessa) ON UPDATE CASCADE);
load data local infile '/home/us3r011/Downloads/progetto tsw/popolamento/Effettua.sql'
into table Effettua LINES TERMINATED BY '\r\n' (CF,Cod_prenotazione,Cod_scommessa,DataScommessa);
CREATE TABLE Squadra(
	Cod_squadra CHAR(5) NOT NULL, 
	Nome VARCHAR(25) NOT NULL, 
	PRIMARY KEY(Cod_squadra));
load data local infile '/home/us3r011/Downloads/progetto tsw/popolamento/Squadra.sql'
into table Squadra LINES TERMINATED BY '\r\n' (Cod_squadra,Nome);
CREATE TABLE Evento(
	Palinsesto CHAR(5) NOT NULL,
	Evento CHAR(5) NOT NULL, 
	DataEvento DATE NOT NULL,
	CasaCod_squadra CHAR(5) NOT NULL, 
	TrasfertaCod_squadra CHAR(5) NOT NULL,
	Quota1 DOUBLE PRECISION NOT NULL,
    QuotaX DOUBLE PRECISION NOT NULL,
	Quota2 DOUBLE PRECISION NOT NULL,
	PRIMARY KEY(Palinsesto, Evento), 
	FOREIGN KEY(CasaCod_squadra) REFERENCES Squadra(Cod_squadra) ON UPDATE CASCADE,
	FOREIGN KEY(TrasfertaCod_squadra) REFERENCES Squadra(Cod_squadra) ON UPDATE CASCADE);
load data local infile '/home/us3r011/Downloads/progetto tsw/popolamento/Evento.sql'
into table Evento LINES TERMINATED BY '\r\n' (Palinsesto,Evento,DataEvento,CasaCod_squadra,TrasfertaCod_squadra,Quota1,QuotaX,Quota2);
CREATE TABLE E_Composto(
	ID int NOT NULL AUTO_INCREMENT,
	Cod_scommessa CHAR(5),
	Cod_prenotazione CHAR(5),
	Quota DOUBLE PRECISION NOT NULL, 
	Esito VARCHAR(10) DEFAULT "In corso",
	Pronostico VARCHAR(30) NOT NULL, 
	Palinsesto CHAR(5) NOT NULL,
	Evento CHAR(5) NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(Cod_scommessa) REFERENCES Scommessa(Cod_scommessa) ON UPDATE CASCADE,
	FOREIGN KEY(Cod_prenotazione) REFERENCES Prenotazione(Cod_prenotazione) ON UPDATE CASCADE,
	FOREIGN KEY(Palinsesto,Evento) REFERENCES Evento(Palinsesto,Evento) ON UPDATE CASCADE);
load data local infile '/home/us3r011/Downloads/progetto tsw/popolamento/E_Composto.sql'
into table E_Composto LINES TERMINATED BY '\r\n' (Cod_scommessa,Cod_prenotazione,Quota,Esito,Pronostico,Palinsesto,Evento);
