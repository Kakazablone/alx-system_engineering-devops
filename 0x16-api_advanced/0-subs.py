#!/usr/bin/python3
'''Module that tests out the Reddit API'''
from requests import get


def number_of_subscribers(subreddit):
    '''
    Queries the Reddit API and returns the number of subscribers
    (not active users, total subscribers) for a given subreddit
    '''
    headers = {'User-Agent': 'VICTORY'}
    response = get(
        'https://www.reddit.com/r/{}/about.json'.format(str(subreddit)),
        headers=headers,
        allow_redirects=False)
    if response.status_code != 200:
        return 0
    data = response.json()
    """Fetch required data"""
    return data.get('data').get('subscribers')
