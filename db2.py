import sqlite3
con = sqlite3.connect("prosjekt.db")
cursor = con.cursor()

# Åpner filen og splitter på semikolon
with open('sql_ferdig.sql', 'r') as sql_file:
    sql_commands = sql_file.read().split(';')

# Kjører alle kommandoene i filen
for command in sql_commands:
    try:
        cursor.execute(command)
    except sqlite3.OperationalError as e:
        print('Command skipped: ', e)

cursor.execute('''INSERT INTO Teaterstykke VALUES('Kongsemnene', 'Henrik Ibsen') ''')

# Lukker databaseforbindelsen
con.close()