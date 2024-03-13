with open('hovedscenen.txt', 'r') as file:
    lines = file.readlines()
    area = ''
    row = 0
    id = 332
    seat = 0
    for line in reversed(lines):
        line = line.strip()
        if line in ['Galleri', 'Parkett']:
            area = line
            row = 0
        else:
            row += 1
            for value in line:
                seat += 1
                id += 1
                print(f"INSERT INTO Stol (StolID, StolNr, RadNr, Område, SalID) VALUES ({id}, {seat}, {row}, '{area}', {1});")