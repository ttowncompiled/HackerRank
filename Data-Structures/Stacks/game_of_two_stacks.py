#!/bin/python3

'''
We can define the solution to this problem using recursion:

    def choose(a, b, i, j, x)
        if x < a.next and x < b.next
            return 0
        else if a.next <= x < b.next
            return 1 + choose(a, b, i+1, j, x-a[i])
        else if b.next <= x < a.next
            return 1 + choose(a, b, i, j+1, x-b[j])
        else
            return 1 + max{ choose(a, b, i+1, j, x-a[i]),
                            choose(a, b, i, j+1, x-b[j]) }
        end
    end

However, this solution will lead to a stack overflow. To prevent the
stack overflow, we must rewrite the recursive definition above to use
an explicit stack. The question is what should be pushed to the stack?
There are two stacks of cups: a and b. We can use our explicit stack
to store the cups we take from a, but not from b. After we've taken
as many cups from a and then b that we can, we put cups back on a, and
then take as many more b cups that we can. Each time we do so, we
record the maximum number of cups that we've been able to set aside.
The crux of this problem is recognize that taking cups a, b, a is the
same as taking cups a, a, b or b, a, a. The order doesn't matter.
This is also why we don't store b cups on our explicit stack.
Because the order doesn't matter, we can just focus on how many more b cups
we can get for one a cup.
'''

g = int(input())  # type: int
for _ in range(g):
    n, m, x = map(int, input().split())  # type: int, type: int, type: int
    a = list(map(int, input().split()))  # type: List[int]
    b = list(map(int, input().split()))  # type: List[int]
    # i: int, j: int
    i = j = 0  # rather than unshifting, we can use idxes
    stack = []  # type: List[int]
    while i < len(a) and a[i] <= x:  # take as many cups from a as we can
        x -= a[i]
        stack.append(a[i])  # push each cup we take from a to the stack
        i += 1
    while j < len(b) and b[j] <= x:  # if we've taken all of a, take from b
        x -= b[j]
        j += 1
    # max_cups: int, cups: int
    max_cups = cups = i + j  # record the number of cups taken from a and b
    while j < len(b) and stack:  # once we've taken all cups from b, end
        a_i = stack.pop()  # replace the cups of a, one at a time
        x += a_i
        cups -= 1
        while j < len(b) and b[j] <= x:  # take more cups from b
            x -= b[j]
            cups += 1
            j += 1
        max_cups = max(max_cups, cups)  # take best
    print(max_cups)
