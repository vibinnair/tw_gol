class Neighbours

	def initialize
		@cells = []
	end

	def <<(cell)
		@cells << cell 
	end  

	def count
		@cells.count
	end

	def alive
		@cells.select do |cell|
			cell.alive?
		end					
	end
end
