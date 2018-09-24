#!/bin/python3

'''
A greedy solution can be used for this problem. Since all three stacks are
required to have the same height, the tallest stack must be popped. Therefore,
we can continually pop the tallest stack until all stacks are the same height.
Rather than recording the elements in the stack, the stacks will record the
current height. Each stack will be initialized with a first element of 0 to
show that each stack begins with 0 height.
'''

s_1, s_2, s_3 = [0], [0], [0]  # type: List[int], List[int], List[int]
n_1, n_2, n_3 = map(int, input().split())  # type: int, type: int, type: int

# i: int
for i in map(int, input().split()[::-1]):
    s_1.append(s_1[-1] + i)
# j: int
for j in map(int, input().split()[::-1]):
    s_2.append(s_2[-1] + j)
# k: int
for k in map(int, input().split()[::-1]):
    s_3.append(s_3[-1] + k)

while s_1[-1] != s_2[-1] or s_2[-1] != s_3[-1]:
    if s_1[-1] >= s_2[-1] and s_1[-1] >= s_3[-1]:
        s_1.pop()  # if s_1 has the greatest height, pop from s_1
    elif s_2[-1] >= s_3[-1] and s_2[-1] >= s_1[-1]:
        s_2.pop()  # if s_2 has the greatest height, pop from s_2
    else:
        s_3.pop()  # if s_3 has the greatest height, pop from s_3

print(s_1[-1])
