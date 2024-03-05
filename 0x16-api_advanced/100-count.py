import requests

def count_words(subreddit, word_list, after=None, count=None):
    if after is None:
        count = {word.lower(): 0 for word in word_list}

    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    response = requests.get(url, params={'after': after}, headers={'user-agent': 'bhalut'})

    if response.status_code == 200:
        data = response.json()

        for topic in data['data']['children']:
            for word in topic['data']['title'].split():
                for target_word in word_list:
                    if word.lower() == target_word.lower():
                        count[target_word.lower()] += 1

        after = data['data']['after']
        if after is None:
            sorted_words = sorted(count.items(), key=lambda x: (-x[1], x[0]))
            for word, count in sorted_words:
                if count > 0:
                    print("{}: {}".format(word, count))
        else:
            count_words(subreddit, word_list, after, count)
