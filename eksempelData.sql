-- Teaterstykker
INSERT INTO Teaterstykke (Tittel, Dramatiker) VALUES ('Kongsemnene', 'Henrik Ibsen');
INSERT INTO Teaterstykke (Tittel, Dramatiker) VALUES ('Storst av alt er kjaerligheten', 'Jonas Corell Petersen');

-- Akt
INSERT INTO Akt (AktNr, Tittel, Navn) VALUES (1, 'Kongsemnene', "Placeholder");
INSERT INTO Akt (AktNr, Tittel, Navn) VALUES (2, 'Kongsemnene', "Placeholder");
INSERT INTO Akt (AktNr, Tittel, Navn) VALUES (3, 'Kongsemnene', "Placeholder");
INSERT INTO Akt (AktNr, Tittel, Navn) VALUES (4, 'Kongsemnene', "Placeholder");
INSERT INTO Akt (AktNr, Tittel, Navn) VALUES (5, 'Kongsemnene', "Placeholder");

-- Skuespiller 
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (1, 'Arturo', 'Scotti');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (2, 'Ingunn Beate', 'Stige oyen');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (3, 'Hans Petter', 'Nilsen');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (4, 'Madeleine', 'Brandtzaeg Nilsen');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (5, 'Synnove', 'Fossum Eriksen');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (6, 'Emma Caroline', 'Deichmann');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (7, 'Thomas', 'Jensen Takyi');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (8, 'Per', 'Bogstad Gulliksen');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (9, 'Isak', 'Holmen Sorensen');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (10, 'Fabian', 'Heidelberg Lunde');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (11, 'Emil', 'Olafsson');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (12, 'Snorre', 'Ryen Tondel');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (13, 'Sunniva', 'Du Mond Nordal');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (14, 'Jo', 'Saberniak');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (15, 'Marte', 'Steinholt');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (16, 'Tor Ivar', 'Hagen');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (17,'Trond-Ove', 'Skrodal');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (18, 'Natalie', 'Grondahl Tangen');
INSERT INTO Skuespiller (SkuespillerID, Fornavn, Etternavn) VALUES (19, 'aasmund', 'Flaten');


-- Rolle
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Haakon Haakonson', 1);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Dagfinn Bonde', 11);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Jatgeir Skald', 11);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Sigrid', 6);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Ingeborg', 6);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Guttorm Ingesson', 8);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Skule Jarl', 3);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Inga fraa Vartejg', 2);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Paal Flida', 9);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Ragnhild', 4);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Gregorius Jonsson', 8);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Margrete', 5);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Biskop Nikolas', 7);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Peter', 12);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Sunniva Du Mond Nordal', 13);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Jo Saberniak', 14);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Marte Steinholt', 15);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Tor Ivar Hagen', 16);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Trond-Ove Skrodal', 17);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('Natalie Grondahl Tangen', 18);
INSERT INTO Rolle (RolleNavn, SkuespillerID) VALUES ('aasmund Flaten', 19);

-- AktRolleForhold
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Kongsemnene', 'Haakon Haakonson');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Kongsemnene', 'Dagfinn Bonde');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Kongsemnene', 'Sigrid');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Kongsemnene', 'Skule Jarl');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Kongsemnene', 'Inga fraa Vartejg');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Kongsemnene', 'Paal Flida');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Kongsemnene', 'Gregorius Jonsson');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Kongsemnene', 'Margrete');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Kongsemnene', 'Biskop Nikolas');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Kongsemnene', 'Peter');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Kongsemnene', 'Guttorm Ingesson');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (2, 'Kongsemnene', 'Haakon Haakonson');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (2, 'Kongsemnene', 'Dagfinn Bonde');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (2, 'Kongsemnene', 'Sigrid');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (2, 'Kongsemnene', 'Skule Jarl');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (2, 'Kongsemnene', 'Inga fraa Vartejg');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (2, 'Kongsemnene', 'Paal Flida');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (2, 'Kongsemnene', 'Gregorius Jonsson');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (2, 'Kongsemnene', 'Margrete');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (2, 'Kongsemnene', 'Biskop Nikolas');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (2, 'Kongsemnene', 'Peter');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (3, 'Kongsemnene', 'Haakon Haakonson');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (3, 'Kongsemnene', 'Dagfinn Bonde');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (3, 'Kongsemnene', 'Skule Jarl');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (3, 'Kongsemnene', 'Paal Flida');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (3, 'Kongsemnene', 'Gregorius Jonsson');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (3, 'Kongsemnene', 'Margrete');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (4, 'Kongsemnene', 'Haakon Haakonson');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (4, 'Kongsemnene', 'Dagfinn Bonde');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (4, 'Kongsemnene', 'Jatgeir Skald');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (4, 'Kongsemnene', 'Ingeborg');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (4, 'Kongsemnene', 'Skule Jarl');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (4, 'Kongsemnene', 'Paal Flida');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (4, 'Kongsemnene', 'Gregorius Jonsson');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (4, 'Kongsemnene', 'Margrete');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (5, 'Kongsemnene', 'Haakon Haakonson');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (5, 'Kongsemnene', 'Dagfinn Bonde');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (5, 'Kongsemnene', 'Sigrid');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (5, 'Kongsemnene', 'Paal Flida');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (5, 'Kongsemnene', 'Ragnhild');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (5, 'Kongsemnene', 'Gregorius Jonsson');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (5, 'Kongsemnene', 'Margrete');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (5, 'Kongsemnene', 'Biskop Nikolas');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (5, 'Kongsemnene', 'Peter');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Storst av alt er kjaerligheten', 'Sunniva Du Mond Nordal');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Storst av alt er kjaerligheten', 'Jo Saberniak');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Storst av alt er kjaerligheten', 'Marte Steinholt');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Storst av alt er kjaerligheten', 'Tor Ivar Hagen');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Storst av alt er kjaerligheten', 'Trond-Ove Skrodal');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Storst av alt er kjaerligheten', 'Natalie Grondahl Tangen');
INSERT INTO AktRolleForhold (AktNr, Tittel, RolleNavn) VALUES (1, 'Storst av alt er kjaerligheten', 'aasmund Flaten');


-- Kulisser
INSERT INTO Kulisser (KulissID, KulissType, Tittel) VALUES (1, "Placeholder", "Placeholder");

-- Ansatt
INSERT INTO Ansatt (AnsattID, Fornavn, Etternavn, Epost, AnsattStatus, AnsattType) VALUES (1, 'Yury', 'Butusov', "Placeholder", 'Fast', 'Regissor');
INSERT INTO Ansatt (AnsattID, Fornavn, Etternavn, Epost, AnsattStatus, AnsattType) VALUES (2, 'Aleksandr', 'Shishkinhokusai', "Placeholder", 'Fast', 'Scenograf');
INSERT INTO Ansatt (AnsattID, Fornavn, Etternavn, Epost, AnsattStatus, AnsattType) VALUES (3, 'Eivind', 'Myren', "Placeholder", 'Fast', 'Lysdesigner');
INSERT INTO Ansatt (AnsattID, Fornavn, Etternavn, Epost, AnsattStatus, AnsattType) VALUES (4, 'Mina', 'Rype Stokke', "Placeholder", 'Fast', 'Dramaturg');
INSERT INTO Ansatt (AnsattID, Fornavn, Etternavn, Epost, AnsattStatus, AnsattType) VALUES (5, 'Jonas', 'Corell Petersen', "Placeholder", 'Fast', 'Regissor');
INSERT INTO Ansatt (AnsattID, Fornavn, Etternavn, Epost, AnsattStatus, AnsattType) VALUES (6, 'David', 'Gehrt', "Placeholder", 'Fast', 'Scenograf');
INSERT INTO Ansatt (AnsattID, Fornavn, Etternavn, Epost, AnsattStatus, AnsattType) VALUES (7, 'Gaute', 'Tonder', "Placeholder", 'Fast', 'Lyddesigner');
INSERT INTO Ansatt (AnsattID, Fornavn, Etternavn, Epost, AnsattStatus, AnsattType) VALUES (8, 'Magnus', 'Mikaelsen', "Placeholder", 'Fast', 'Lysdesigner');
INSERT INTO Ansatt (AnsattID, Fornavn, Etternavn, Epost, AnsattStatus, AnsattType) VALUES (9, 'Kristoffer', 'Spender', "Placeholder", 'Fast', 'Dramaturg');

-- JobberPaa
INSERT INTO JobberPaa (AnsattID, Tittel) VALUES (1, 'Kongsemnene');
INSERT INTO JobberPaa (AnsattID, Tittel) VALUES (2, 'Kongsemnene');
INSERT INTO JobberPaa (AnsattID, Tittel) VALUES (3, 'Kongsemnene');
INSERT INTO JobberPaa (AnsattID, Tittel) VALUES (4, 'Kongsemnene');
INSERT INTO JobberPaa (AnsattID, Tittel) VALUES (5, 'Storst av alt er kjaerligheten');
INSERT INTO JobberPaa (AnsattID, Tittel) VALUES (6, 'Storst av alt er kjaerligheten');
INSERT INTO JobberPaa (AnsattID, Tittel) VALUES (7, 'Storst av alt er kjaerligheten');
INSERT INTO JobberPaa (AnsattID, Tittel) VALUES (8, 'Storst av alt er kjaerligheten');
INSERT INTO JobberPaa (AnsattID, Tittel) VALUES (9, 'Storst av alt er kjaerligheten');

-- Sal
INSERT INTO Sal (SalID, Navn, AntallPlasser) VALUES (1, 'Hovedscenen', 516);
INSERT INTO Sal (SalID, Navn, AntallPlasser) VALUES (2, 'Gamle scene', 332);
INSERT INTO Sal (SalID, Navn, AntallPlasser) VALUES (3, 'Studioscenen', 150);
INSERT INTO Sal (SalID, Navn, AntallPlasser) VALUES (4, 'Teaterscenen', 60);
INSERT INTO Sal (SalID, Navn, AntallPlasser) VALUES (5, 'Teaterkafeen', 100);


-- Fremvises
INSERT INTO Fremvises (Tittel, SalID) VALUES ('Kongsemnene', 1);
INSERT INTO Fremvises (Tittel, SalID) VALUES ('Storst av alt er kjaerligheten', 2);


-- Forestillinger

-- Forestillinger for Kongsemnene
INSERT INTO Forestilling (Tittel, Dato, Starttid) VALUES ('Kongsemnene', '2024-02-01', '19:00:00');
INSERT INTO Forestilling (Tittel, Dato, Starttid) VALUES ('Kongsemnene', '2024-02-02', '19:00:00');
INSERT INTO Forestilling (Tittel, Dato, Starttid) VALUES ('Kongsemnene', '2024-02-03', '19:00:00');
INSERT INTO Forestilling (Tittel, Dato, Starttid) VALUES ('Kongsemnene', '2024-02-05', '19:00:00');
INSERT INTO Forestilling (Tittel, Dato, Starttid) VALUES ('Kongsemnene', '2024-02-06', '19:00:00');

-- Forestillinger for Storst av alt er kjaerligheten
INSERT INTO Forestilling (Tittel, Dato, Starttid) VALUES ('Storst av alt er kjaerligheten', '2024-02-03', '18:30:00');
INSERT INTO Forestilling (Tittel, Dato, Starttid) VALUES ('Storst av alt er kjaerligheten', '2024-02-06', '18:30:00');
INSERT INTO Forestilling (Tittel, Dato, Starttid) VALUES ('Storst av alt er kjaerligheten', '2024-02-07', '18:30:00');
INSERT INTO Forestilling (Tittel, Dato, Starttid) VALUES ('Storst av alt er kjaerligheten', '2024-02-12', '18:30:00');
INSERT INTO Forestilling (Tittel, Dato, Starttid) VALUES ('Storst av alt er kjaerligheten', '2024-02-13', '18:30:00');
INSERT INTO Forestilling (Tittel, Dato, Starttid) VALUES ('Storst av alt er kjaerligheten', '2024-02-14', '18:30:00');

-- Stoler

-- Gamlescenen parkett



-- BillettType
INSERT INTO BillettType (BillettTypeID, Gruppestatus, KundeType) VALUES (1, False, 'Ordinaer');
INSERT INTO BillettType (BillettTypeID, Gruppestatus, KundeType) VALUES (2, False, 'Honnor');
INSERT INTO BillettType (BillettTypeID, Gruppestatus, KundeType) VALUES (3, False, 'Student');
INSERT INTO BillettType (BillettTypeID, Gruppestatus, KundeType) VALUES (4, False, 'Barn');
INSERT INTO BillettType (BillettTypeID, Gruppestatus, KundeType) VALUES (5, True, 'Ordinaer');
INSERT INTO BillettType (BillettTypeID, Gruppestatus, KundeType) VALUES (6, True, 'Honnor');


-- Pris
INSERT INTO Pris (BillettTypeID, Tittel, Pris) VALUES (1, 'Kongsemnene', 450);
INSERT INTO Pris (BillettTypeID, Tittel, Pris) VALUES (2, 'Kongsemnene', 380);
INSERT INTO Pris (BillettTypeID, Tittel, Pris) VALUES (3, 'Kongsemnene', 280);
INSERT INTO Pris (BillettTypeID, Tittel, Pris) VALUES (5, 'Kongsemnene', 420);
INSERT INTO Pris (BillettTypeID, Tittel, Pris) VALUES (6, 'Kongsemnene', 360);
INSERT INTO Pris (BillettTypeID, Tittel, Pris) VALUES (1, 'Storst av alt er kjaerligheten', 350);
INSERT INTO Pris (BillettTypeID, Tittel, Pris) VALUES (2, 'Storst av alt er kjaerligheten', 300);
INSERT INTO Pris (BillettTypeID, Tittel, Pris) VALUES (3, 'Storst av alt er kjaerligheten', 220);
INSERT INTO Pris (BillettTypeID, Tittel, Pris) VALUES (4, 'Storst av alt er kjaerligheten', 220);
INSERT INTO Pris (BillettTypeID, Tittel, Pris) VALUES (5, 'Storst av alt er kjaerligheten', 320);
INSERT INTO Pris (BillettTypeID, Tittel, Pris) VALUES (6, 'Storst av alt er kjaerligheten', 270);



-- Kunde
INSERT INTO Kunde (KundeID, TlfNr, Fornavn, Etternavn, Adresse, KundeType) VALUES (1, 12345678, 'Ola', 'Nordmann', 'Nordmannsveien 1', 'Ordinaer');

-- Billett
--INSERT INTO Billett (BillettID, StolID, Tittel, Dato, BillettTypeID) VALUES ();

-- Billetkjop
--INSERT INTO Billetkjop (KundeID, BillettID, Dato, Tid) VALUES ();


