#!/usr/bin/python3
"""
Module that queries the reddit API
"""

from requests import get


def top_ten(subreddit):
    """
    function that queries the Reddit API and prints the titles of the first
    10 hot posts listed for a given subreddit
    """

    if subreddit is None or not isinstance(subreddit, str):
        print("None")

    user_agent = {'User-agent': 'VICTORY'}
    params = {'limit': 10}
    url = 'https://www.reddit.com/r/{}/hot/.json'.format(subreddit)

    response = get(url, headers=user_agent, params=params)
    results = response.json()

    try:
        rqd_info = results.get('data').get('children')

        for item in rqd_info:
            print(item.get('data').get('title'))

    except Exception:
        print("None")
