class Board
	attr_reader :size

	#class methods
	def self.print_grid(arr)
		arr.each do |row|
			puts row.join(" ")
		end
	end

	#initialize
	def initialize (n)
		@grid = Array.new(n) { Array.new(n, :N) }
		@size = @grid.length * @grid[0].length
	end

	#syntactical methods
	def [](arr)
		@grid[arr[0]][arr[1]]
	end

	def []=(pos, val)
		@grid[pos[0]][pos[1]] = val
	end

	#instance methods
	def num_ships
		sPos = 0
		@grid.flatten.each { |ele| sPos += 1 if ele == :S }
		sPos
	end

	def attack (pos)
		if self[pos] == :S
			self[pos] = :H
			p "You sunk my battleship!"
			return true
		else
			self[pos] = :X
			return false
		end
	end

	def place_random_ships
		quarter = @grid.flatten.length / 4
		placed = 0

		while placed != quarter
			rand1 = rand(@grid.length)
			rand2 = rand(@grid[0].length)

			if @grid[rand1][rand2] == :N
				@grid[rand1][rand2] = :S
				placed += 1
			end
		end
	end

	def hidden_ships_grid
		newGrid = Array.new(@grid.length) { Array.new(@grid[0].length, nil) }

		@grid.each_with_index do |arr, x|
			arr.each_with_index do |ele, y|
				if ele != :S
					newGrid[x][y] = ele
				else
					newGrid[x][y] = :N
				end
			end
		end

		newGrid
	end

	def cheat
		Board.print_grid(@grid)
	end
	
	def print
		Board.print_grid(hidden_ships_grid)
	end
end
