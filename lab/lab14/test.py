from lab14 import *


link = Link(1, Link(2, Link(3)))
print(link)
#<1 2 3>
insert(link, 9001, 0)
print(link)
#<9001 1 2 3>
insert(link, 100, 2)
print(link)
#<9001 1 100 2 3>
insert(link, 4, 5)
IndexError