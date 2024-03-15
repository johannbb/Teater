-- Oppretter Teaterstykke-tabellen
CREATE TABLE Teaterstykke (
    Tittel VARCHAR(255) PRIMARY KEY,
    Dramatiker VARCHAR(255) NOT NULL
);

-- Oppretter Akt-tabellen
CREATE TABLE Akt (
    AktNr INT,
    Tittel VARCHAR(255),
    Navn VARCHAR(255) NOT NULL,
    PRIMARY KEY (AktNr, Tittel),
    FOREIGN KEY (Tittel) REFERENCES Teaterstykke(Tittel)
);

-- Oppretter Skuespiller-tabellen
CREATE TABLE Skuespiller (
    SkuespillerID INT PRIMARY KEY,
    Fornavn VARCHAR(255) NOT NULL,
    Etternavn VARCHAR(255) NOT NULL
);

-- Oppretter Rolle-tabellen
CREATE TABLE Rolle (
    RolleNavn VARCHAR(255) PRIMARY KEY,
    SkuespillerID INT,
    FOREIGN KEY (SkuespillerID) REFERENCES Skuespiller(SkuespillerID)
);

-- Oppretter AktRolleForhold-tabellen
CREATE TABLE AktRolleForhold (
    AktNr INT,
    Tittel VARCHAR(255),
    RolleNavn VARCHAR(255),
    PRIMARY KEY (AktNr, Tittel, RolleNavn),
    FOREIGN KEY (AktNr, Tittel) REFERENCES Akt(AktNr, Tittel),
    FOREIGN KEY (RolleNavn) REFERENCES Rolle(RolleNavn)
);

-- Oppretter Kulisser-tabellen
CREATE TABLE Kulisser (
    KulissID INT PRIMARY KEY,
    KulissType VARCHAR(255) NOT NULL,
    Tittel VARCHAR(255),
    FOREIGN KEY (Tittel) REFERENCES Teaterstykke(Tittel)
);

-- Oppretter Ansatt-tabellen
CREATE TABLE Ansatt (
    AnsattID INT PRIMARY KEY,
    Fornavn VARCHAR(255) NOT NULL,
    Etternavn VARCHAR(255) NOT NULL,
    Epost VARCHAR(255) NOT NULL,
    AnsattStatus VARCHAR(50) NOT NULL,
    AnsattType VARCHAR(50) NOT NULL
);

-- Oppretter JobberPaa-tabellen
CREATE TABLE JobberPaa (
    AnsattID INT,
    Tittel VARCHAR(255),
    PRIMARY KEY (AnsattID, Tittel),
    FOREIGN KEY (AnsattID) REFERENCES Ansatt(AnsattID),
    FOREIGN KEY (Tittel) REFERENCES Teaterstykke(Tittel)
);

-- Oppretter Sal-tabellen
CREATE TABLE Sal (
    SalID INT PRIMARY KEY,
    Navn VARCHAR(255) NOT NULL,
    AntallPlasser INT NOT NULL
);

-- Oppretter Fremvises-tabellen
CREATE TABLE Fremvises (
    Tittel VARCHAR(255),
    SalID INT,
    PRIMARY KEY (Tittel, SalID),
    FOREIGN KEY (Tittel) REFERENCES Teaterstykke(Tittel),
    FOREIGN KEY (SalID) REFERENCES Sal(SalID)
);

-- Oppretter Forestilling-tabellen
CREATE TABLE Forestilling (
    Tittel VARCHAR(255),
    Dato DATE,
    StartTid TIME,
    PRIMARY KEY (Tittel, Dato),
    FOREIGN KEY (Tittel) REFERENCES Teaterstykke(Tittel)
);

-- Oppretter Stol-tabellen
CREATE TABLE Stol (
    StolID INT PRIMARY KEY,
    StolNr INT NOT NULL,
    RadNr INT NOT NULL,
    Omraade VARCHAR(50) NOT NULL,
    SalID INT,
    FOREIGN KEY (SalID) REFERENCES Sal(SalID)
);

-- Oppretter BillettType-tabellen (Endret gruppestatus fra varchar til boolean)
CREATE TABLE BillettType (
    BillettTypeID INT PRIMARY KEY,
    Gruppestatus BOOLEAN,
    Kundetype VARCHAR(50)
);

-- Oppretter Pris-tabellen
CREATE TABLE Pris (
    BillettTypeID INT,
    Tittel VARCHAR(255),
    Pris DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (BillettTypeID, Tittel),
    FOREIGN KEY (BillettTypeID) REFERENCES BillettType(BillettTypeID),
    FOREIGN KEY (Tittel) REFERENCES Teaterstykke(Tittel)
);

-- Oppretter Kunde-tabellen
CREATE TABLE Kunde (
    KundeID INT PRIMARY KEY,
    TlfNr VARCHAR(20) NOT NULL,
    Fornavn VARCHAR(255) NOT NULL,
    Etternavn VARCHAR(255) NOT NULL,
    Adresse VARCHAR(255) NOT NULL,
    KundeType VARCHAR(50) NOT NULL
);

-- Oppretter Billett-tabellen
CREATE TABLE Billett (
    BillettID INT PRIMARY KEY,
    StolID INT,
    Tittel VARCHAR(255),
    Dato DATE,
    BillettTypeID INT,
    FOREIGN KEY (StolID) REFERENCES Stol(StolID),
    FOREIGN KEY (Tittel, Dato) REFERENCES Forestilling(Tittel, Dato),
    FOREIGN KEY (BillettTypeID) REFERENCES BillettType(BillettTypeID)
);

-- Oppretter Billettkjop-tabellen
CREATE TABLE Billettkjop (
    KundeID INT,
    BillettID INT,
    Dato DATE NOT NULL,
    Tid TIME NOT NULL,
    PRIMARY KEY (KundeID, BillettID),
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID),
    FOREIGN KEY (BillettID) REFERENCES Billett(BillettID)
);
