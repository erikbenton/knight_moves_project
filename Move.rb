class Move

	attr_accessor :position, :parent

	def initialize(position=[0,0], parent=0)
		@position = position
		@parent = parent
	end

end