import sqlite3
import datetime
con = sqlite3.connect("prosjekt.db")
cursor = con.cursor()

current_time = datetime.datetime.now()
formatted_time = current_time.strftime("%H:%M")

#BRUKERHISTORIE 1
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

#BRUKERHISTORIE 2
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
                  cursor.execute(f"INSERT INTO Billett (BillettID, StolID, Tittel, Dato, BillettTypeID) VALUES ({billettID}, {seatId}, '{tittel}', '{dato[1]}', {1});")
                  cursor.execute(f"INSERT INTO Stol (StolID, StolNr, RadNr, Omraade, SalID) VALUES ({stolID}, {seat}, {row}, '{area}', {1});")
                  if value[1] == '1':
                      cursor.execute(f"INSERT INTO Billettkjop (KundeID, BillettID, Dato, Tid) VALUES ({1}, {billettID}, '{dato[1]}', '{formatted_time}');")

def retrieveSeats():
    retrieveAvailableSeatsFromGamleScenen()
    retrieveAvailableSeatsFromHovedScenen()


#BRUKERHISTORIE 3
currentRow = 0
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

def buyTickets(availableRows):
  global currentRow
  if currentRow >= len(availableRows):
    print("Ingen flere tilgjengelige rader for å kjøpe billetter.")
    return

  query = """
    SELECT Billett.BillettID, Pris.Pris
    FROM Billett
    JOIN Stol ON Billett.StolID = Stol.StolID
    JOIN Pris ON Billett.Tittel = Pris.Tittel AND Billett.BillettTypeID = Pris.BillettTypeID
    WHERE Stol.RadNr = ?
    AND Stol.Omraade = ?
    AND Stol.SalID = ?
    AND Billett.BillettTypeID IN (
        SELECT BillettTypeID
        FROM BillettType
        WHERE BillettTypeID = 1)
    AND Billett.BillettID NOT IN (
        SELECT BillettID
        FROM Billettkjop)
    LIMIT 9;
    """
  cursor.execute(query, (availableRows[currentRow][0], availableRows[currentRow][1], availableRows[currentRow][2]))
  tickets = cursor.fetchall()
  dato = '2024-02-03'

  for ticket in tickets:
    cursor.execute(f"INSERT INTO Billettkjop (KundeID, BillettID, Dato, Tid) VALUES ({1}, {ticket[0]}, '{dato}', '{formatted_time}');")
  currentRow += 1

def calculateTotalPrice(availableRows):
  global currentRow
  query = """
    SELECT SUM(subquery.Pris)
    FROM (
    SELECT Pris.Pris
    FROM Billett
    JOIN Stol ON Billett.StolID = Stol.StolID
    JOIN Pris ON Billett.Tittel = Pris.Tittel AND Billett.BillettTypeID = Pris.BillettTypeID
    WHERE Stol.RadNr = ?
    AND Stol.Omraade = ?
    AND Stol.SalID = ?
    AND Billett.BillettTypeID IN (
        SELECT BillettTypeID
        FROM BillettType
        WHERE BillettTypeID = 1)
    LIMIT 9
    ) AS subquery;
    """

  cursor.execute(query, (availableRows[currentRow][0], availableRows[currentRow][1], availableRows[currentRow][2]))
  price = cursor.fetchall()

  return price[0][0]
  
def findSeatsAndTickets():
    availableRows = getAvailableRows()
    buyTickets(availableRows)
    calculateTotalPrice(availableRows)

#BRUKERHISTORIE 4
def getForestillingAndTicketsSold(dato):
  query =  """
    SELECT Forestilling.Dato, Forestilling.Tittel, COALESCE(COUNT(Billettkjop.BillettID), 0) AS antallSolgt  
    FROM Forestilling
    LEFT JOIN Billett ON Forestilling.Tittel = Billett.Tittel AND Forestilling.Dato = Billett.Dato
    LEFT JOIN Billettkjop ON Billettkjop.BillettID = Billett.BillettID
    WHERE Forestilling.Dato = ?
    GROUP BY Forestilling.Dato, Forestilling.Tittel;
    """
  cursor.execute(query, (dato, ))
  forestillinger = cursor.fetchall()
  
  for forestilling in forestillinger:
    print(f'Dato: {forestilling[0]} Tittel: {forestilling[1]} Antall solgt: {forestilling[2]}')

#BRUKERHISTORIE 5
def actorsInShow(tittel):
  query = """
    SELECT DISTINCT AktRolleForhold.Tittel, AktRolleForhold.RolleNavn, Skuespiller.Fornavn, Skuespiller.Etternavn
    FROM AktRolleForhold
    JOIN Rolle ON AktRolleForhold.RolleNavn = Rolle.RolleNavn
    JOIN Skuespiller ON Skuespiller.SkuespillerID = Rolle.SkuespillerID
    WHERE AktRolleForhold.Tittel = ?;
    """
  cursor.execute(query, (tittel, ))
  actorsInShow = cursor.fetchall()
  
  for actor in actorsInShow:
    print(f'Tittel: {actor[0]} Rollenavn: {actor[1]} Skuespillernavn: {actor[2]} {actor[3]} ')

#BRUKERHISTORIE 6
def bestSold():
  query = """
    SELECT Forestilling.Dato, Forestilling.Tittel, COALESCE(COUNT(Billettkjop.BillettID), 0) AS antallSolgt  
    FROM Forestilling
    LEFT JOIN Billett ON Forestilling.Tittel = Billett.Tittel AND Forestilling.Dato = Billett.Dato
    LEFT JOIN Billettkjop ON Billettkjop.BillettID = Billett.BillettID
    GROUP BY Forestilling.Dato, Forestilling.Tittel
    ORDER BY antallSolgt DESC;
    """
  
  cursor.execute(query)
  bestSold = cursor.fetchall()
  
  for show in bestSold:
    print(f'Dato: {show[0]} Tittel: {show[1]} Antall solgte billetter: {show[2]}')

#BRUKERHISTORIE 7
def findColleagues(fornavn, etternavn):
  query = """
    SELECT DISTINCT s1.Fornavn AS 'Fornavn1', s1.Etternavn AS 'Etternavn1', 
                s2.Fornavn AS 'Fornavn2', s2.Etternavn AS 'Etternavn2', 
                a.Tittel AS 'Teaterstykke'
    FROM Skuespiller s1
    JOIN Rolle r1 ON s1.SkuespillerID = r1.SkuespillerID
    JOIN AktRolleForhold arf1 ON r1.RolleNavn = arf1.RolleNavn
    JOIN Akt a ON arf1.AktNr = a.AktNr AND arf1.Tittel = a.Tittel
    JOIN AktRolleForhold arf2 ON a.AktNr = arf2.AktNr AND a.Tittel = arf2.Tittel
    JOIN Rolle r2 ON arf2.RolleNavn = r2.RolleNavn
    JOIN Skuespiller s2 ON r2.SkuespillerID = s2.SkuespillerID
    WHERE s1.Fornavn = ?
    AND s1.Etternavn = ?
    AND s2.SkuespillerID <> s1.SkuespillerID;
    """
  cursor.execute(query, (fornavn, etternavn))
  colleagues = cursor.fetchall()
  
  for colleague in colleagues:
    print(f'Skuespiller: {colleague[0]} {colleague[1]} Kollega: {colleague[2]} {colleague[3]} Teaterstykke: {colleague[4]}')


while True:
  print("Velg en operasjon å utføre:")
  print("1. Brukerhistorie 1")
  print("2. Brukerhistorie 2")
  print("3. Brukerhistorie 3")
  print("4. Brukerhistorie 4")
  print("5. Brukerhistorie 5")
  print("6. Brukerhistorie 6")
  print("7. Brukerhistorie 7")
  print("8. Exit")
 

  choice = input("Velg et tall for å utføre en operasjon: ")

  if choice == '1':
      createTable()
      insertExampleData()
      print("Databasen er opprettet og data er satt inn")
  elif choice == '2':
     retrieveSeats()
     print("Stoler er registrert i systemet")
  elif choice == '3':
      availableRows = getAvailableRows()
      if not availableRows:
          print("Ingen tilgjengelige rader.")
          continue
      buyTickets(availableRows)
      print("9 kjøp er lagt til i billettkjøp")
      print(f'Totalpris: {calculateTotalPrice(availableRows)} kr')
  elif choice == '4':
      date = input("Skriv inn ønsket dato (YYYY-MM-DD): ")
      getForestillingAndTicketsSold(date)
  elif choice == '5':
      show = input("Skriv inn tittel på forestilling (uten æøå): ")
      actorsInShow(show)
  elif choice == '6':
      bestSold()
  elif choice == '7':
      fornavn = input("Skriv inn fornavn: ")
      etternavn = input("Skriv inn etternavn: ")
      findColleagues(fornavn, etternavn)
  elif choice == '8':
    print("Exiting")
    break
  else:
    print("Invalid choice.")

# Lukker databaseforbindelsen
con.commit()
con.close()