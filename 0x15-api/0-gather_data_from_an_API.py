#!/usr/bin/python3
"""Accesses a REST API for todo lists of employees"""

import requests
from sys import argv


if __name__ == '__main__':
    emp_Id = argv[1]
    baseUrl = "https://jsonplaceholder.typicode.com/users"
    url = f"{baseUrl}/{emp_Id}"

    with requests.get(url) as response:
        emp_Name = response.json().get('name')

    todoUrl = f"{url}/todos"

    with requests.get(todoUrl) as response:
        tasks = response.json()

    done_tasks = [task for task in tasks if task.get('completed')]
    done = len(done_tasks)

    print("Employee {} is done with tasks({}/{}):"
          .format(emp_Name, done, len(tasks)))
    for task in done_tasks:
        print("\t " + task.get("title"))
