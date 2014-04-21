# -*- coding: utf-8 -*-
import sys
import itertools


alph = "abcdefghijklmnopqrstuvwxyz"


def permute_changing_symbol(word, alphabet):
    """
    >>> a = permute_changing_symbol("as", "cd")
    >>> list(a)
    ['as', 'cs', 'ds', 'ac', 'ad']
    """
    yield word
    for i in xrange(len(word)):
        for c in alphabet:
            yield word[:i] + c + word[i + 1:]


def permute_inserting_symbol(word, alphabet):
    """
    >>> a = permute_inserting_symbol("as", "cd")
    >>> list(a)
    ['cas', 'das', 'acs', 'ads', 'asc', 'asd']
    """
    for i in xrange(len(word) + 1):
        for c in alphabet:
            yield word[:i] + c + word[i:]


def permute_deleting_symbol(word):
    """
    >>> a = permute_deleting_symbol("asd")
    >>> list(a)
    ['sd', 'ad', 'as']
    """
    for i in xrange(len(word)):
        yield word[:i] + word[i + 1:]


def get_friends(word, corpus, alphabet):
    friends = [word for word in itertools.chain(permute_changing_symbol(word, alphabet),
                                                permute_inserting_symbol(word, alphabet),
                                                permute_deleting_symbol(word)) if word in corpus]
    return friends


def get_social_network_size(word, corpus, alphabet):
    friends = set([word])
    network = set()
    while friends:
        new_friends = set()
        for friend in friends:
            new_friends.update(get_friends(friend, corpus, alphabet))
        new_friends = new_friends.difference(network)
        network.update(new_friends)
        friends = new_friends

    return len(network)


def main():
    with open(sys.argv[1], 'r') as f:
        corpus = [word.strip() for word in f]

    corpus_dict = set(corpus)
    net_size = get_social_network_size("hello", corpus_dict, alph)
    print net_size

if __name__ == "__main__":
    main()
