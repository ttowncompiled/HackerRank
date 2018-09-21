#!/bin/ruby

################################################################################
# The solution can be computed by iterating over all elements of the grid
# and computing the best product for each element. The trick is to recognize
# that we only need to compute half as many products as there are directions.
################################################################################

grid = []
(1..20).each do
    grid.push(gets.strip.split.map(&:to_i))
end

s = 0
(0...20).each do |i|
    (0...20).each do |j|
        if i <= 16 && j <= 16   # lower right diagonal / upper left diagonal
            s = [ s, grid[i][j]*grid[i+1][j+1]*grid[i+2][j+2]*grid[i+3][j+3] ].max
        end
        if 3 <= i && j <= 16    # upper right diagonal / lower left diagonal
            s = [ s, grid[i][j]*grid[i-1][j+1]*grid[i-2][j+2]*grid[i-3][j+3] ].max
        end
        if i <= 16              # horizontal right / horiztonal left
            s = [ s, grid[i][j]*grid[i+1][j]*grid[i+2][j]*grid[i+3][j] ].max
        end
        if j <= 16              # vertical down / vertical up
            s = [ s, grid[i][j]*grid[i][j+1]*grid[i][j+2]*grid[i][j+3] ].max
        end
    end
end

puts s
