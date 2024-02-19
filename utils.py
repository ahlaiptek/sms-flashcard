import os
import json

def run(cmd):
    os.system(cmd)

def sleep(second):
    run(f'sleep {second}')

def clear():
    run('clear')

import json

def read_json(file_path):
    try:
        with open(file_path, 'r') as file:
            data = json.load(file)
            if isinstance(data, list):
                return data
            else:
                print("File JSON tidak mengandung list.")
                return None
    except FileNotFoundError:
        print(f"File tidak ditemukan: {file_path}")
        return None
    except json.JSONDecodeError:
        print(f"File JSON tidak dapat di-decode. Pastikan format JSON valid: {file_path}")
        return None

def send_sms(number, message):
    run(f'termux-sms-send -n {number} "{message}"')
