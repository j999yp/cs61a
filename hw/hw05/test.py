from hw05 import *

import types
[isinstance(gen, types.GeneratorType) for gen in remainders_generator(5)]
[True, True, True, True, True]
remainders_four = remainders_generator(4)
for i in range(4):
    print("First 3 natural numbers with remainder {0} when divided by 4:".format(i))
    gen = next(remainders_four)
    for _ in range(3):
        print(next(gen))
