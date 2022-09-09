from scheme import *

global_frame=create_global_frame()
bindings = Pair(Pair('x', Pair(2, nil)), Pair(Pair('y', nil), nil)) # equivalent to ((x 2) (y))
make_let_frame(bindings, global_frame)