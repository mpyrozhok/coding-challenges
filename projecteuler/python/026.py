

def generate_remainder_chain(limit):
    """
    >>> generate_remainder_chain(7)
    ''
    """
    remainders = []
    remainder = 1
    i = 0
    while i < limit * 2 and remainder != 0:
        remainder = remainder % limit
        remainders.append(remainder)
        remainder *= 10
        i += 1
    return remainders


def get_longest_recurrence(line, limit=0):
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
    max_len = 0
    for i in range(1, 1000):
        line = generate_remainder_chain(i)
        length = get_longest_recurrence(line, i)
        if length > max_len:
            max_len = length
    print max_len


if __name__ == "__main__":
#    import doctest
#    doctest.testmod()
    main()
