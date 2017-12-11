class Knight

	attr_accessor :position

	def initialize(position=[0, 0])
		@position = position
	end

	def knight_moves(starting_pos=@position, ending_pos=@position)

		move_list = starting_pos.inspect.to_s

		return move_list if starting_pos == ending_pos

		next_moves = self.calc_moves(starting_pos)

		if next_moves.index(ending_pos)
			return move_list += next_moves[next_moves.index(ending_pos)].inspect.to_s
		end

		more_moves = []

		next_moves.each do |move|
			more_moves = self.calc_moves(move)
		end

	end

	def calc_moves(starting_pos=[0, 0])

		possible_moves = []

		changes = [[1,2], [-1,-2], [-1,2], [1,-2], [2,1], [-2,-1], [-2,1], [2,-1]]

		changes.each do |change|
			new_position = []
			new_position.push(starting_pos[0] + change[0])
			new_position.push(starting_pos[1] + change[1])
			if (new_position[0] >= 0 && new_position[1] >= 0) && new_position[0] <= 8 && new_position[1] <= 8
				possible_moves.push(new_position)
			end
		end

		possible_moves
	end

end