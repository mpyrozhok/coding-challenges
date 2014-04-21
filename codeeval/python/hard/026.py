# -*- coding: utf-8 -*-
import itertools
import sys


def get_first_recurrence(line, limit=0):
    """
    >>> get_longest_recurrence("aa1jsdfkkffnna1jsdfaasdasdfasdfasdfkasdfkkasdflbbaabasdfo")
    'asdf'
    """
    start = 1
    for i, s in enumerate(line):
        if len(line) > 1 and line[start] == s and start != i:
            if i == 2:
                return limit
            else:
                return i
    return 0


def main():
    with open(sys.argv[1]) as f:
        for line in f:
            numbers = itertools.imap(int, line.split())
            recurrence = get_first_recurrence(numbers)
            if recurrence:
                print " ".join(itertools.imap(str, recurrence))


if __name__ == "__main__":
    main()
