import sqlite3
import datetime
con = sqlite3.connect("prosjekt.db")
cursor = con.cursor()

current_time = datetime.datetime.now()
formatted_time = current_time.strftime("%H:%M")


def createTable():    
  # aapner filen og splitter paa semikolon
  with open('sql_ferdig.sql', 'r') as sql_file:
      sql_commands = sql_file.read().split(';')

  # Kjorer alle kommandoene i filen
  for command in sql_commands:
      try:
          cursor.execute(command)
      except sqlite3.OperationalError as e:
          print('Command skipped: ', e)

def insertExampleData():
    # aapner filen og splitter paa semikolon
  with open('eksempelData.sql', 'r') as sql_file:
      sql_commands = sql_file.read().split(';')

  # Kjorer alle kommandoene i filen
  for command in sql_commands:
      try:
          cursor.execute(command)
      except sqlite3.OperationalError as e:
          print('Command skipped: ', e)

def retrieveAvailableSeatsFromGamleScenen():
    
  # Henter data fra gamle-scene
  with open('gamle-scene.txt', 'r') as file:
      lines = file.readlines()
      row = 0
      seatId = 0
      stolID = 0
      billettID = 0
      area = 'Parkett'
      tittel = "Storst av alt er kjaerligheten"
      dato = lines.pop(0).strip().split()

      for line in reversed(lines):
          line = line.strip()
          if line in ['Parkett']:
              area = 'Balkong'
              row = 0
          elif line in ['Balkong']:
              area = 'Galleri'
              row = 0
          elif line in ['Galleri']:
              #do nothing
              area = 'Galleri'
          else:
              row += 1
              for seat, value in enumerate(line, start=1):
                  seatId += 1
                  billettID += 1
                  stolID += 1
                  print("billettId: " + str(billettID) + "verdi: " + str(value))
                  cursor.execute(f"INSERT INTO Billett (BillettID, StolID, Tittel, Dato, BillettTypeID) VALUES ({billettID}, {seatId}, '{tittel}', '{dato[1]}', {1});")
                  cursor.execute(f"INSERT INTO Stol (StolID, StolNr, RadNr, Omraade, SalID) VALUES ({stolID}, {seat}, {row}, '{area}', {2});")
                  if value == '1':
                      cursor.execute(f"INSERT INTO Billettkjop (KundeID, BillettID, Dato, Tid) VALUES ({1}, {billettID}, '{dato[1]}', '{formatted_time}');")

def retrieveAvailableSeatsFromHovedScenen():
  
  # Henter data fra gamle-scene
  with open('hovedscenen.txt', 'r') as file:
      lines = file.readlines()
      row = 0
      seatId = 332
      billettID = 332
      stolID = 332
      tittel = "Kongsemnene"
      area = 'Parkett'
      seat = 0
      dato = lines.pop(0).strip().split()

      for line in reversed(lines):
          line = line.strip()
          if line in ['Parkett']:
              area = 'Galleri'
              row = 0
          elif line in ['Galleri']:
              #do nothing
              area = 'Galleri'
          else:
              row += 1
              for value in enumerate(line, start=1):
                  seatId += 1
                  billettID += 1
                  stolID += 1
                  seat += 1
                  print("billettId: " + str(billettID) + "verdi: " + str(value))
                  cursor.execute(f"INSERT INTO Billett (BillettID, StolID, Tittel, Dato, BillettTypeID) VALUES ({billettID}, {seatId}, '{tittel}', '{dato[1]}', {1});")
                  cursor.execute(f"INSERT INTO Stol (StolID, StolNr, RadNr, Omraade, SalID) VALUES ({stolID}, {seat}, {row}, '{area}', {1});")
                  if value[1] == '1':
                      cursor.execute(f"INSERT INTO Billettkjop (KundeID, BillettID, Dato, Tid) VALUES ({1}, {billettID}, '{dato[1]}', '{formatted_time}');")

## HUSKE Å LEGGE TIL RIKTIG DATO PÅ BillettKjop

def getAvailableRows():
  query = """
    SELECT Stol.RadNr, Stol.Omraade, Stol.SalID, COUNT(*) AS AntallBilletter
    FROM Billett
    JOIN Stol ON Billett.StolID = Stol.StolID
    WHERE Billett.Dato = '2024-02-03'
    AND Billett.BillettTypeID IN (
        SELECT BillettTypeID
        FROM BillettType
        WHERE BillettTypeID = 1
    )
    AND Billett.BillettID NOT IN (
        SELECT BillettID
        FROM Billettkjop
    )
    AND Billett.Tittel = 'Storst av alt er kjaerligheten'
    GROUP BY Stol.RadNr, Stol.Omraade
    HAVING COUNT(*) > 8;
    """
    
  cursor.execute(query)
  rows = cursor.fetchall()
  return rows

def buyTickets(amountOfTickets, availableRows):
  
  query = """
    SELECT Billett.BillettID
    FROM Billett
    JOIN Stol ON Billett.StolID = Stol.StolID
    WHERE Stol.RadNr = ?
    AND Stol.Omraade = ?
    AND Stol.SalID = ?
    LIMIT 9;
    """
  cursor.execute(query, (availableRows[0][0], availableRows[0][1], availableRows[0][2]))
  tickets = cursor.fetchall()
  dato = '2024-02-03'

  price = 0
  for ticket in tickets:
    cursor.execute(f"INSERT INTO Billettkjop (KundeID, BillettID, Dato, Tid) VALUES ({1}, {ticket[0]}, '{dato}', '{formatted_time}');")

def retrieveSeats():
    retrieveAvailableSeatsFromGamleScenen()
    retrieveAvailableSeatsFromHovedScenen()

def findSeatsAndTickets():
    availableRows = getAvailableRows()
    buyTickets(9, availableRows)
# Lukker databaseforbindelsen
                  
#createTable()
#insertExampleData()
#retrieveSeats()
findSeatsAndTickets()
con.commit()
con.close()