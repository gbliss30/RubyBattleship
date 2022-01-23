require_relative "board"
require_relative "player"

class Battleship
	attr_reader :board, :player

	def initialize(n)
		@player = Player.new
		@board = Board.new(n)
		@remaining_misses = board.size / 2
	end

	def start_game
		@board.place_random_ships
		p @board.num_ships
		@board.print
	end

	def lose?
		if @remaining_misses <= 0
			p "you lose"
			return true
		end
		false
	end

	def win?
		if @board.num_ships == 0
			p "you win"
			return true
		end
		false
	end

	def game_over?
		if lose? || win?
			return true
		end
		false
	end

	def turn
		move = @player.get_move
		current_status = @board[move]

		@board.attack(move)
		@board.print

		if @board[move] != current_status && @board[move] == :X
			@remaining_misses -= 1
			puts "Remaining misses: #{@remaining_misses}"
		end

	end
end
