import os

def run_FIFA1():
    os.system('python FIFA1.py')

def run_FIFA2():
    os.system('python FIFA2.py')



def main_menu():
    while True:
        print("Main Menu:")
        print("1. Run FIFA1")
        print("2. Run FIFA2")
        print("0. Exit")
        choice = input("Enter your choice (0-2): ")
        
        if choice == '1':
            run_FIFA1()
        elif choice == '2':
            run_FIFA2()
        elif choice == '0':
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main_menu()

