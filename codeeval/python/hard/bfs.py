# -*- coding: utf8 -*-

from collections import deque
import itertools


def dfs_list(tree, node):
    """
    >>> s = [1, [2, [4, None, None], [5, None, None]], [3, [6, None, None], [7, None, None]]]
    >>> dfs_list(s, 4)
    deque([])
    """
    def val_none(v):
        return v[0] if v is not None else None

    current = tree
    q = deque()
    path = deque()
    q.append(tree)
    path.append(current[0])
    while current[0] != node and len(q) > 0:
        current = q.pop()
        for child in current[1:]:
            if child:
                q.append(child)
                path.append(child[0])
        path.pop()
    return q


def convert_to_tree(sequence):
    """
    >>> s = [(1,), (2, 3), (4, 5, 6, 7)]
    >>> convert_to_tree(s)
    [1, [2, [4, None, None], [5, None, None]], [3, [6, None, None], [7, None, None]]]
    """
    if sequence:
        return add_tree_node(sequence, 0, 0)


def add_tree_node(sequence, level, i):
    """
    >>> s = [(1,), (2, 3), (4, 5, 6, 7)]
    >>> add_tree_node(s, 0, 0)
    [1, [2, [4, None, None], [5, None, None]], [3, [6, None, None], [7, None, None]]]
    """
    if len(sequence) > level:
        node = sequence[level][i]
        return [node,
                add_tree_node(sequence, level + 1, i * 2),
                add_tree_node(sequence, level + 1, i * 2 + 1)]
    else:
        return None


class BinaryTree:

    def __init__(self, value):
        """
        """
        self.value = value
        self.left = None
        self.right = None
        self.parent = None

    def __repr__(self):
        return "{0} [ {1} {2} ]".format(self.value, self.left, self.right)


def dfs(tree, node_value):
    """
    >>> s = [(1,), (2, 3), (4, 5, 6, 7)]
    >>> tree = parse_tree(s)
    >>> dfs(tree, 4)
    4 [ None None ]
    """
    q = deque()
    q.append(tree)
    while len(q) > 0:
        current = q.pop()

        if current.value == node_value:
            return current
        else:
            for n in (current.left, current.right):
                if n is not None:
                    q.append(n)


def path_to_root(node):
    """
    >>> s = [(1,), (2, 3), (4, 5, 6, 7)]
    >>> tree = parse_tree(s)
    >>> node = dfs(tree, 4)
    >>> list(path_to_root(node))
    [1, 2]
    """
    path = deque()
    current = node
    while current is not None:
        path.appendleft(current.value)
        current = current.parent
    return list(path)


def parse_tree(sequence):
    """
    >>> s = [(1,), (2, 3), (4, 5, 6, 7)]
    >>> parse_tree(s)
    1 [ 2 [ 4 [ None None ] 5 [ None None ] ] 3 [ 6 [ None None ] 7 [ None None ] ] ]
    """
    if sequence:
        return add_node(sequence, 0, 0)


def add_node(sequence, level, i):
    """
    >>> s = [(1,), (2, 3), (4, 5, 6, 7)]
    >>> add_node(s, 0, 0)
    1 [ 2 [ 4 [ None None ] 5 [ None None ] ] 3 [ 6 [ None None ] 7 [ None None ] ] ]
    """
    if len(sequence) > level:
        value = sequence[level][i]
        left = add_node(sequence, level + 1, i * 2)
        right = add_node(sequence, level + 1, i * 2 + 1)
        node = BinaryTree(value)
        for n in (left, right):
            if n is not None:
                n.parent = node
        node.left = left
        node.right = right
        return node
    else:
        return None


def main():
    input = [(1,), (2, 3), (4, 5, 6, 7), (8, 9, 10, 11, 12, 13, 14, 15)]
    tree = parse_tree(input)
    first_node = dfs(tree, 8)
    second_node = dfs(tree, 15)
    first_path = path_to_root(first_node)
    second_path = path_to_root(second_node)
    lca = list(itertools.takewhile(lambda (x, y): x == y,
                                   zip(first_path, second_path)))[-1][0]
    not_lca = lambda x: x != lca
    second_branch = list(itertools.dropwhile(not_lca, second_path))[1:]
    path = itertools.chain(itertools.takewhile(not_lca,
                                               reversed(first_path)),
                           [lca],
                           second_branch)
    print list(path)[1:][:-1]


if __name__ == "__main__":
    main()
