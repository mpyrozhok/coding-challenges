import itertools


def transform_to_spiral(n, m, matrix):
    l = []
    for i in xrange(m):
        row_length = m - i
        column_start = m - i - 1

        l.extend(matrix[:row_length])
        del matrix[:row_length]

        l.extend(matrix[column_start::row_length])
        del matrix[column_start::row_length]

        matrix = matrix[::-1]
    return l


def matrix_circles(matrix):
    n = len(matrix[0])
    m = len(matrix)
    print ", ".join(map(str, transform_to_spiral(n, m, list(itertools.chain(*matrix)))))

matrix_circles([(1, 2, 3, 4), (5, 6, 7, 8), (9, 10, 11, 12), (13, 14, 15, 16)])
