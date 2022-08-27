import lab02

def add1(x):
    return x + 1
def times2(x):
    return x * 2
def add3(x):
    return x + 3
my_cycle = lab02.cycle(add1, times2, add3)
identity = my_cycle(0)
print(identity(5))
add_one_then_double = my_cycle(2)
print(add_one_then_double(1))