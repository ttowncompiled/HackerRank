#!/bin/python3

'''
The solution to this problem requires a really neat algorithm that
can be performed with a stack. For any array, a stack can be
used to compute either the two smallest elements or the two
largest elements of every contiguous subarray in O(n) time.
The algorithm requires a stack and a placeholder for the two best elements.
To compute the two smallest elements, we must first push the leftmost
element of the array onto the stack. Then, for each next element a_i of
the array, we check if (a_i, stack.top) is the best pair. Then,
as long as a_i <= stack.top, we pop the stack, and check if (a_i, stack.top)
is the best pair. Once the stack is empty or once a_i > stack.top, we push
a_i onto the stack and move on. We must push a_i on top of the stack so
that it can be matched with the next element. This covers contiguous
subarrays of size=2. The key idea of this algorithm is that
if we are looking for the two smallest elements, then we can only push
larger elements on top of smaller elements in the stack. By doing so,
we can continue to pop elements off of the stack to match them with
the current element (effectively creating a contiguous subarray to the
left of the current element). If, however, the current element is smaller
than the entire stack, then no element to the right of the current element
gains any benefit by extending a contiguous subarray past the current element
as it is smaller than all elements to its left. Thus, once we've encountered
an element that is smaller than all elements to its left, we have effectively
solved for the left half of the array. The other thing to note about this
particular problem is that the computation can be reduced to XOR. The XOR
of an AND and an OR is XOR, and the AND of XOR and XOR is just XOR.
'''

n = int(input())  # type: int
a = map(int, input().split())  # type: List[int]

stack = []  # type: List[int]
max_xor = 0  # type: int  the best pair is just the best XOR

# a_i: int
for a_i in a:
    if not stack:  # if stack is empty
        stack.append(a_i)  # load the leftmost element
        continue
    while stack:
        max_xor = max(max_xor, stack[-1] ^ a_i)  # check for best pair, use XOR
        if a_i <= stack[-1]:  # only place larger on top of smaller
            stack.pop()
        else:
            break
    stack.append(a_i)  # place element on top, used to match subarrays.size=2

print(max_xor)
