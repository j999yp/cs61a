from lab09 import *

t = Tree(1, [Tree(2), Tree(3), Tree(4)])
reverse_other(t)
t
Tree(1, [Tree(4), Tree(3), Tree(2)])
t = Tree(1, [Tree(2, [Tree(3, [Tree(4), Tree(5)]), Tree(6, [Tree(7)])]), Tree(8)])
reverse_other(t)
t
Tree(1, [Tree(8, [Tree(3, [Tree(5), Tree(4)]), Tree(6, [Tree(7)])]), Tree(2)])