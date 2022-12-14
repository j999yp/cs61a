HW_SOURCE_FILE=__file__


def pascal(row, column):
    """Returns a number corresponding to the value at that location
    in Pascal's Triangle.
    >>> pascal(0, 0)
    1
    >>> pascal(0, 5)	# Empty entry; outside of Pascal's Triangle
    0
    >>> pascal(3, 2)	# Row 4 (1 3 3 1), 3rd entry
    3
    """
    "*** YOUR CODE HERE ***"
    if(column==0 or row==column):
        return 1
    elif(column>row):
        return 0
    else:
        return(pascal(row-1,column-1)+pascal(row-1,column))
#    def gen_row(row):
#        if(row==0):
#            return [1]
#        else:
#            old_row=gen_row(row-1)
#            new_row=[1]
#            for i in range(1,row):
#                new_row.append(old_row[i-1]+old_row[i])
#            new_row.append(1)
#            return new_row
#    nums=gen_row(row)
#    try:
#        return nums[column]
#    except:
#        return 0


def compose1(f, g):
    """"Return a function h, such that h(x) = f(g(x))."""
    def h(x):
        return f(g(x))
    return h

def repeated(f, n):
    """Return the function that computes the nth application of func (recursively!).

    >>> add_three = repeated(lambda x: x + 1, 3)
    >>> add_three(5)
    8
    >>> square = lambda x: x ** 2
    >>> repeated(square, 2)(5) # square(square(5))
    625
    >>> repeated(square, 4)(5) # square(square(square(square(5))))
    152587890625
    >>> repeated(square, 0)(5)
    5
    >>> from construct_check import check
    >>> # ban iteration
    >>> check(HW_SOURCE_FILE, 'repeated',
    ...       ['For', 'While'])
    True
    """
    "*** YOUR CODE HERE ***"
    if(n==0):
        return lambda x: x
    else:
        return compose1(f,repeated(f,n-1))    


def num_eights(x):
    """Returns the number of times 8 appears as a digit of x.

    >>> num_eights(3)
    0
    >>> num_eights(8)
    1
    >>> num_eights(88888888)
    8
    >>> num_eights(2638)
    1
    >>> num_eights(86380)
    2
    >>> num_eights(12345)
    0
    >>> from construct_check import check
    >>> # ban all assignment statements
    >>> check(HW_SOURCE_FILE, 'num_eights',
    ...       ['Assign', 'AugAssign'])
    True
    """
    "*** YOUR CODE HERE ***"
    if(x==0):
        return 0
    return num_eights(x//10) + int(x%10==8)


def pingpong(n):
    """Return the nth element of the ping-pong sequence.

    >>> pingpong(8)
    8
    >>> pingpong(10)
    6
    >>> pingpong(15)
    1
    >>> pingpong(21)
    -1
    >>> pingpong(22)
    -2
    >>> pingpong(30)
    -2
    >>> pingpong(68)
    0
    >>> pingpong(69)
    -1
    >>> pingpong(80)
    0
    >>> pingpong(81)
    1
    >>> pingpong(82)
    0
    >>> pingpong(100)
    -6
    >>> from construct_check import check
    >>> # ban assignment statements
    >>> check(HW_SOURCE_FILE, 'pingpong', ['Assign', 'AugAssign'])
    True
    """
    "*** YOUR CODE HERE ***"
#    if(n==1 or n==2):
#        return n
#    else:
#        # tri = num_eights(n-1) or (n-1)%8==0
#        # inc = pingpong(n-1)-pingpong(n-2)
#        # (-2 * tri +1) * inc
#        return pingpong(n-1) + (-2 * (num_eights(n-1) or (n-1)%8==0) + 1) * (pingpong(n-1)-pingpong(n-2))
    def func(num,cnt,direction):
        if(cnt==n):
            return num
        else:
            return func(num+direction,cnt+1,direction*(-2 * (num_eights(cnt+1)>0 or (cnt+1)%8==0) + 1))
    return func(1,1,1)












