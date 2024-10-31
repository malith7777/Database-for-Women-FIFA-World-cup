import mysql.connector

# Connect
conn = mysql.connector.connect(
    host='localhost',
    user='Malith',
    password='@Stcmatara123',
    database='Malith_20926076'
)

# Checking connection
if conn.is_connected():
    print('Connection successful')
    cursor = conn.cursor()

    while True:
        # Display 
        print("Choose an entry:")
        print("1. Insert")
        print("2. Update")
        print("3. Delete")
        print("4. Show Tables")
        print("5. Show Data in Tables")
        print("0. Exit")
        choice = int(input("Enter choice: "))

        if choice == 0:
            break

        if choice == 1:
            # Insert
            query = input('Enter the INSERT data: ')
            cursor.execute(query)
            conn.commit()
            print('INSERT completed.')

        elif choice == 2:
            # Update
            query = input('Enter the UPDATE data: ')
            cursor.execute(query)
            conn.commit()
            print('UPDATE completed.')

        elif choice == 3:
            # Delete
            query = input('Enter the DELETE data: ')
            cursor.execute(query)
            conn.commit()
            print('DELETE completed.')

        elif choice == 4:
            # Tables
            cursor.execute("SHOW TABLES")
            tables = cursor.fetchall()
            for table in tables:
                print(table[0])

        elif choice == 5:
            # Show Data
            cursor.execute("SELECT * FROM coach")
            data = cursor.fetchall()
            print("Data of 'coach' table:")
            for row in data:
                print(row)

            cursor.execute("SELECT * FROM team")
            data = cursor.fetchall()
            print("Data of 'team' table:")
            for row in data:
                print(row)

            cursor.execute("SELECT * FROM player")
            data = cursor.fetchall()
            print("Data of 'player' table:")
            for row in data:
                print(row)

            cursor.execute("SELECT * FROM matches")
            data = cursor.fetchall()
            print("Data of 'matches' table:")
            for row in data:
                print(row)

            cursor.execute("SELECT * FROM champ")
            data = cursor.fetchall()
            print("Data of 'champ' table:")
            for row in data:
                print(row)

        else:
            print("Invalid choice.")

    # Close connection
    cursor.close()
    conn.close()
else:
    print('Connection to MySQL failed')
