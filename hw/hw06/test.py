from hw06 import *

s = Link(1, Link(Link(2, Link(3)), Link(4)))
print(deep_map(lambda x: x * x, s))
#<1 <4 9> 16>
print(s) # unchanged
#<1 <2 3> 4>
print(deep_map(lambda x: 2 * x, Link(s, Link(Link(Link(5))))))
#<<2 <4 6> 8> <<10>>>