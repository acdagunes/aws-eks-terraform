#!/usr/bin/env python3
import requests

try:
    # Attempt to hit Google's main API endpoint
    response = requests.get("https://www.google.com", timeout=5)
    
    # Check if the HTTP status code is 200 (Success)
    if response.status_code == 200:
        print("✅ Success! API check (Google) returned 200 OK.")
    else:
        print(f"⚠️ Warning: API check failed with status code: {response.status_code}")

except requests.exceptions.RequestException as e:
    # Handles errors like network failure, timeouts, etc.
    print(f"🛑 Critical Error: Network or request issue occurred: {e}")
