#!/usr/bin/env python3

# Get the current user's name from the environment variables
import os

# Define a simple greeting function
def greet_user():
    username = os.environ.get('USER')
    
    if username:
        print(f"Hello, {username}! Python is now ready for DevOps automation.")
    else:
        print("Hello! Python is ready.")

# Run the function
if __name__ == "__main__":
    greet_user()
