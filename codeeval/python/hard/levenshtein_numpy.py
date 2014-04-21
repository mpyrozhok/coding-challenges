# -*- coding: utf-8 -*-
import sys
import array
import itertools


def trim_common_pref_suff(source, target):
    """
    >>> trim_common_pref_suff("asdfgrrnp", "asdfgnp")
    ('rr', '')
    >>> trim_common_pref_suff("asdfg", "asdfgnp")
    ('', 'np')
    >>> trim_common_pref_suff("asdfgrp", "asdfgnp")
    ('r', 'n')
    >>> trim_common_pref_suff("fgrp", "asdfgnp")
    ('fgr', 'asdfgn')
    >>> trim_common_pref_suff("abfagrp", "asdfgnp")
    ('bfagr', 'sdfgn')
    >>> trim_common_pref_suff("abfagrp", "asdfgnp")
    ('bfagr', 'sdfgn')
    >>> trim_common_pref_suff("maid", "madid")
    ('', 'd')
    >>> trim_common_pref_suff("teened", "teended")
    ('', 'd')
    """
    equal = False
    s1 = min(source, target, key=len)
    s2 = target if source == s1 else source
    for i in xrange(len(s1)):
        if s1[i] != s2[i]:
            source = source[i:]
            target = target[i:]
            break
    else:
        equal = True
        source = source[i + 1:]
        target = target[i + 1:]

    if not equal:
        s1 = min(source, target, key=len)
        s2 = target if source == s1 else source
        for i in xrange(1, len(s1) + 1):
            if s1[-i] != s2[-i]:
                source = source[:1 - i]
                target = target[:1 - i]
                break
        else:
            source = source[:-i]
            target = target[:-i]
    return source, target


def levenshtein(source, target):

    source, target = trim_common_pref_suff(source, target)

    target_len = len(target)
    source_len = len(source)
    if source == target:
        return 0
    if source_len == 0:
        return target_len
    if target_len == 0:
        return source_len

    source_v = array.array('I', xrange(target_len + 1))
    target_v = array.array('I', xrange(target_len + 1))

    for i in xrange(source_len):
        target_v[0] = i + 1

        for j in xrange(target_len):
            cost = 0 if source[i] == target[j] else 1
            target_v[j + 1] = min(target_v[j] + 1, source_v[j + 1] + 1, source_v[j] + cost)

        source_v = array.array('I', target_v)

    return target_v[-1]


def hamming(s1, s2):
    return sum(ch1 != ch2 for ch1, ch2 in zip(s1, s2))


def get_friends(word, neighbours, seen_words, seen_new_words):
    result = set()
    word_len = len(word)

    # searching friends only in words with length difference +-1
    for neighbour in itertools.chain(*neighbours[word_len - 2:word_len + 1]):
        if neighbour not in seen_words and neighbour not in seen_new_words:
            if word_len == len(neighbour):
                distance = hamming(word, neighbour)
            else:
                distance = levenshtein(word, neighbour)
            if distance == 1:
                result.add(neighbour)
    return result


def get_social_network(word, neighbours):
    seen_words = set()
    friends = get_friends(word, neighbours, seen_words, seen_words)
    seen_words.update(friends)
    while friends:
        seen_new_words = set()
        for friend in friends:
            new_friends = get_friends(friend, neighbours, seen_words, seen_new_words)
            seen_new_words.update(new_friends)
        friends = seen_new_words
        seen_words.update(friends)
    return seen_words


def vectorize_corpus_by_length(corpus):
    max_len = len(max(corpus, key=len))
    result = [[] for a in xrange(max_len)]
    for word in corpus:
        result[len(word) - 1].append(word)
    return result


def main():
    filename = ""
    if len(sys.argv) > 1:
        filename = sys.argv[1]
    else:
        print "Please specify filename as a parameter"
        return

    with open(filename, 'r') as f:
        corpus = [word.strip() for word in f]

    vectorized_corpus = vectorize_corpus_by_length(corpus)
    friends = get_social_network("hello", vectorized_corpus)
    print len(friends)


if __name__ == "__main__":
    main()
