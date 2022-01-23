class Player
	def get_move
		print "enter a position with coordinates separated with a space like `4 7`"
		response = gets.chomp.split(" ")
		[response[0].to_i, response[1].to_i]
	end
end
