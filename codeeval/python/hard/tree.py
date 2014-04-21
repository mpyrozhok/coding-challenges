def path_from_root(element, tree):
    path = []
    current = element
    while current > 1:
        current = current >> 1
        path.append(current)
    return path

tr = [[1], [2, 3], [4, 5, 6, 7], [8, 9, 10, 11, 12, 13, 14, 15]]
print path_from_root(5, tr)
print path_from_root(10, tr)
