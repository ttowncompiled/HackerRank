#!/bin/ruby

################################################################################
# The Pythagorean triples can be generated for arbitrary values of N using
# Diophantine equations. Using the Diophantine equations, we have that
#
#   a = 2*k*u*v, b = k(u**2 - v**2), c = k(u**2 + v**2), where
#       k, u, v : positive integers,
#       u, v : coprime
#       u <= v
#
# If we plugged these back into the equation, a + b + c = N, we have that:
#
#   2*k*u(u+v) = N => 2 | N, k | N, u | N, (u+v) | N
#
# Let, w = u + v => v = w - u. We can rewrite our Diophantine equations
# in terms of w:
#
#   a = 2*k*u(w - u), b = k*w(2u - w), c = k(2u**2 + w**2 - 2*u*w)
#   N = 2*k*u*w
#
# With this, we can lay out a few properties:
#   (1) N must be even to have a triple. 2*k*u*w = N => 2 | N.
#   (2) u, v must have different parity. u, v are coprime, and two evens
#       can't be coprime.
#   (3) w must be odd. w = u + v, and u, v have different parity.
#   (4) w is a factor of N. 2*k*u*w = N => w | N.
#   (5) 3 <= w < sqrt(N). Combine (3) and (4).
#   (6) 0 < a, b, c. This is an tacit requirement for a triple.
#   (7) a = 2*k*u(w - u) => u < w. Otherwise a < 0.
#   (8) b = k*w(2u - w) => w < 2u. Otherwise, b < 0.
#   (9) w/2 < u < w, by (7) and (8).
#   (10) k = N / (2*u*w). 2*k*u*w = N => k = N / (2*u*w)
#
# With these properties, we can devise the following O(sqrt(N)) algorithm
# for computing the Pythagorean triples for any arbitrary N.
################################################################################

t = gets.strip.to_i
(1..t).each do
    n = gets.strip.to_i
    if n % 2 == 1                               # N must be even to have a triple
        puts -1
        next
    end
    w = []
    (3...Math.sqrt(n)).step(2).each do |i|      # 3 <= w < sqrt(N), w must be odd
        if n % i == 0                           # N = 2*k*u*w => w | N
            w.push(i.to_i)                      # i is a triple candidate
        end
    end
    if w.length == 0
        puts -1                                 # not all evens have triples
        next
    end
    triples = []
    w.each do |w_i|
        ((w_i+1)/2...w_i).each do |u|           # w_i/2 < u < w
            if n % (2*u*w_i) == 0               # N = 2*k*u*w => 2*u*w | n, k = N / (2*u*w)
                triples.push({ :u => u, :w => w_i, :k => n / (2*u*w_i) }) # k = N / (2*u*w)
            end
        end
    end
    if triples.length == 0
        puts -1                                 # not all evens have triples
        next
    end
    max_triple = -1
    triples.each do |trip|
        u, w, k = trip[:u], trip[:w], trip[:k]
        a = 2 * k * u * (w - u)                 # Diophantine equation for a
        b = k * w * (2*u - w)                   # Diophantine equation for b
        c = k * (2*u*u + w*w - 2*u*w)           # Diophantine equation for c
        max_triple = [ max_triple, a*b*c ].max  # choose best triple
    end
    puts max_triple
end
