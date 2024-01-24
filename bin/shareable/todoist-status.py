# vim:ft=python

from datetime import UTC, datetime, timedelta
import json
import os
import subprocess
import sys

import requests

CACHE_FILE = '/tmp/todoist-status.cache'
LOG_FILE = '/tmp/todoist-status.log'


def log(s: str):
    with open(LOG_FILE, 'a', encoding='utf-8') as file:
        file.write(f'{datetime.now().strftime("%Y-%m-%d %H:%M:%S")} - {s}\n')


def get_cache():
    log('todoist-status: reading cache')
    if not os.path.isfile(CACHE_FILE):
        return None

    with open(CACHE_FILE, 'r', encoding='utf-8') as file:
        content = file.readline()[1:-2]  # strip $ and \n chars
        parsed_date = datetime.fromtimestamp(int(content), UTC)

        if parsed_date < datetime.now(UTC) - timedelta(minutes=15):
            return None

        log('todoist-status: cache found and valid')
        json_string = file.readline()
        return json.loads(json_string)


def set_cache(json_string: str):
    log('todoist-status: setting cache')
    with open('/tmp/todoist-status.cache', 'w', encoding='utf-8') as file:
        file.write(f'${round(datetime.now().timestamp() * 10)}\n')
        file.write(json_string)


def get_today_tasks_data():
    data = get_cache()
    if data:
        return data

    log('todoist-status: making HTTP request')
    url = "https://api.todoist.com/rest/v2/tasks"

    params = {
        'filter': 'today|overdue'
    }

    headers = {
        "Authorization": "Bearer " + os.environ["TODOIST_TOKEN"]
    }

    r = requests.get(url, params=params, headers=headers, timeout=5.0)
    if r.status_code != 200:
        print('fail')

    data = r.json()
    set_cache(json.dumps(data))
    return data


def get_today_status():
    data = get_today_tasks_data()
    today = datetime.now().strftime("%Y-%m-%d")
    for_today = 0
    overdue = 0
    for _, d in enumerate(data):
        if d['due']['date'] == today:
            for_today += 1
        else:
            overdue += 1

    return f'{for_today} / {overdue}'


def show_today_list_in_rofi():
    data = get_today_tasks_data()
    items = list(data)
    items.sort(key=lambda x: x['due']['date'], reverse=True)
    items = [f'{x['due']['date']} - {x['content']}' for x in items]

    echo = f'"{'\n'.join(items)}"'
    rofi = 'rofi -dmenu -theme-str \'mainbox {children: ["listview"];}\''
    subprocess.call(f'echo -n {echo} | {rofi}', shell=True)


if len(sys.argv) > 2:
    print('ERROR: too many arguments')
    sys.exit(1)

command = 'status' if len(sys.argv) == 1 else sys.argv[1]

match command:
    case 'status':
        print(get_today_status())
    case 'list-rofi':
        print(show_today_list_in_rofi())
    case _:
        print(f'ERROR: unknown command {command}')
        sys.exit(1)
