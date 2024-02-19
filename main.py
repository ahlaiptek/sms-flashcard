import os
import random
from dotenv import load_dotenv

import utils

load_dotenv()
utils.clear()

number = os.getenv('NUMBER')
question = os.getenv('QUESTION')
sleep = os.getenv('SLEEP')

data_json = utils.read_json('data.json')

while True:
    data = random.choice(data_json)
    utils.send_sms(number, data[0])
    utils.sleep(question)
    utils.send_sms(number, f'[Baiklah] {data[1]}')
    utils.sleep(sleep)
