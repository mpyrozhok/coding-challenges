# -*- encoding: utf-8 -*-
import itertools
import sys


def get_path(tree, n):
    path = []
    current_node = tree
    i = 0
    while current_node and current_node[0] != n and i < 10:
        i += 1
        path.append(current_node[0])
        if n < current_node[0]:
            current_node = current_node[1]
        else:
            current_node = current_node[2]
    return path


def main():
    tree = [30, [8, [3, None, None], [20, [10, None, None], [29, None, None]]], [52, None, None]]
    with open(sys.argv[1]) as f:
        for line in f:
            first, second = itertools.imap(int, line.split())
            lowest_common_ancestor = list(itertools.takewhile(lambda x: x[0] == x[1], itertools.izip(get_path(tree, first), get_path(tree, second))))[-1]
            print lowest_common_ancestor
