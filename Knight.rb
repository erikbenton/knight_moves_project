require_relative "Move.rb"

class Knight

	attr_accessor :position

	def initialize(position=[0, 0])
		@position = Move.new(position, -1)
	end

	def knight_moves(starting_pos=@position, ending_pos=@position)

		move_list = []
		move_list.push(starting_pos)

		i = 0

		while(move_list[i].position != ending_pos)
			next_moves = calc_moves(move_list[i].position)
			next_moves.map! { |position| Move.new(position, i) }
			next_moves.each do |move|
				move_list.push(move)
				if move.position == ending_pos
					return path_string(move_list, move, i)
				end
			end
			i += 1
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

	def path_string(moves, move, counter)
		j = counter
		number_of_moves = 0
		path = ""
		while j >= 0
			path = "\n#{move.position.inspect}" + path
			j = move.parent
			move = moves[j]
			number_of_moves += 1
		end
		path = "You made it in #{number_of_moves-1} moves! Here's you path:" + path
		return path
	end

end