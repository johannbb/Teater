import sqlite3
import datetime
con = sqlite3.connect("prosjekt.db")
cursor = con.cursor()

current_time = datetime.datetime.now()
formatted_time = current_time.strftime("%H:%M")


def createTable():    
  # Åpner filen og splitter på semikolon
  with open('sql_ferdig.sql', 'r') as sql_file:
      sql_commands = sql_file.read().split(';')

  # Kjorer alle kommandoene i filen
  for command in sql_commands:
      try:
          cursor.execute(command)
      except sqlite3.OperationalError as e:
          print('Command skipped: ', e)

def insertExampleData():
    # Åpner filen og splitter på semikolon
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
      billettID = 0
      tittel = "Storst av alt er kjærligheten"
      dato = lines.pop(0).strip().split()

      for line in (lines):
          line = line.strip()
          if line in ['Galleri', 'Balkong', 'Parkett']:
              row = 0
          else:
              row += 1
              for seat, value in enumerate(line, start=1):
                  seatId += 1
                  billettID += 1
                  cursor.execute(f"INSERT INTO Billett (BillettID, StolID, Tittel, Dato, BillettTypeID) VALUES ({billettID}, {seatId}, '{tittel}', '{dato[1]}', {1});")
                  if value == '1':
                      cursor.execute(f"INSERT INTO Billettkjop (KundeID, BillettID, Dato, Tid) VALUES ({1}, {billettID}, '{dato[1]}', '{formatted_time}');")

def retrieveAvailableSeatsFromHovedScenen():
  
  # Henter data fra gamle-scene
  with open('hovedscenen.txt', 'r') as file:
      lines = file.readlines()
      row = 0
      seatId = 332
      billettID = 332
      tittel = "Kongsemnene"
      dato = lines.pop(0).strip().split()

      for line in (lines):
          line = line.strip()
          if line in ['Galleri', 'Parkett']:
              row = 0
          else:
              row += 1
              for seat, value in enumerate(line, start=1):
                  seatId += 1
                  billettID += 1
                  cursor.execute(f"INSERT INTO Billett (BillettID, StolID, Tittel, Dato, BillettTypeID) VALUES ({billettID}, {seatId}, '{tittel}', '{dato[1]}', {1});")
                  if value == '1':
                      cursor.execute(f"INSERT INTO Billettkjop (KundeID, BillettID, Dato, Tid) VALUES ({1}, {billettID}, '{dato[1]}', '{formatted_time}');")

def retrieveSeats():
    retrieveAvailableSeatsFromGamleScenen()
    retrieveAvailableSeatsFromHovedScenen()

# Lukker databaseforbindelsen
                  
#createTable()
#insertExampleData()
retrieveSeats()
con.commit()
con.close()