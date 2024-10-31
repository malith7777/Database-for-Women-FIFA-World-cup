import mysql.connector

# Define SQL queries here
queries = [
    "SELECT playerName, Position FROM player;",
    "SELECT * FROM matches WHERE matchdate > '2023-07-25';",
    "SELECT champ_name, matchid FROM champ;",
    "SELECT p.playerName, p.Position, t.teamname FROM player p JOIN team t ON p.teamid = t.teamid;",
    "SELECT t.teamname, COUNT(m.matchid) AS match_count FROM team t LEFT JOIN matches m ON t.teamid = m.teamid GROUP BY t.teamname;",
    "SELECT playerName, age FROM player WHERE age > 25;",
    "SELECT playerName, age, caps FROM player WHERE age > 25;",
    "SELECT playername, age, goals FROM player WHERE goals > 5;",
    "SELECT p.playerName, p.goals FROM player p WHERE p.goals = (SELECT MIN(goals) FROM player);",
    "SELECT t.teamname, c.coachname FROM team t LEFT JOIN coach c ON t.Coachid = c.coachid;"
]

# Connect to mysql server
conn = mysql.connector.connect(
    host='localhost',
    user='Malith',
    password='@Stcmatara123',
    database='Malith_20926076'
)

# Checking connection
if conn.is_connected():
    print('Connection success')
    cursor = conn.cursor()

    while True:
        print('Choose a query:')
        for i, query in enumerate(queries, 1):
            print(f'{i}. Query {i}: {query}')

        print('0. Exit')

        choice = int(input('Enter choice: '))
        if choice == 0:
            break
        elif choice >= 1 and choice <= len(queries):
            query = queries[choice - 1]
            cursor.execute(query)
            result = cursor.fetchall()
            print(result)
        else:
            print('Invalid choice.')

    # Close programm
    cursor.close()
    conn.close()
else:
    print('Connection failed')

