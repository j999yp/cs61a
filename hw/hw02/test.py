def zero(f):
    return (lambda x: x)
#def zero(anything):
#    def inner_func1(x):
#        return x
#    return inner_func1

def successor(n):
    return lambda f: lambda x: f(n(f)(x))
# successor(zero) = f((zero)(f)(x))
# zero(f) = function [g(arg) = arg]
# zero(f)(x) = function [g(arg) = arg] && arg = x ---> x
# successor(zero) = function [f(x)] = one(f)
# additionally, successor(one) = f((one)(f)(x))
# (one)(f)(x) = function [g(arg) = f(arg)] && arg = x ---> f(x)
# so successor(one) = function[f(f(x))] = zero(f)

def one(f):
    """Church numeral 1: same as successor(zero)"""
    return lambda x: f(x)

def two(f):
    """Church numeral 2: same as successor(successor(zero))"""
    return lambda x: f(f(x))


three = successor(two)

def church_to_int(n):
    """Convert the Church numeral n to a Python integer.

    >>> church_to_int(zero)
    0
    >>> church_to_int(one)
    1
    >>> church_to_int(two)
    2
    >>> church_to_int(three)
    3
    """
    return n(lambda x: x+1)(0)

def add_church(m, n):
    """Return the Church numeral for m + n, for Church numerals m and n.

    >>> church_to_int(add_church(two, three))
    5
    """
    "*** YOUR CODE HERE ***"

def mul_church(m, n):
    """Return the Church numeral for m * n, for Church numerals m and n.

    >>> four = successor(three)
    >>> church_to_int(mul_church(two, three))
    6
    >>> church_to_int(mul_church(three, four))
    12
    """
    "*** YOUR CODE HERE ***"

def pow_church(m, n):
    """Return the Church numeral m ** n, for Church numerals m and n.

    >>> church_to_int(pow_church(two, three))
    8
    >>> church_to_int(pow_church(three, two))
    9
    """
    "*** YOUR CODE HERE ***"

