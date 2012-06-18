class World
	include Enumerable

	def initialize
		@cells = []
	end	
	
	def <<(cell)
		@cells << cell
	end
	
	def cell_at(x,y)
		index = @cells.index {|cell| cell.x == x && cell.y == y}
		@cells[index]
	end
	
	def each  
		@cells.each do |cell|
			yield cell
		end
	end
	
	def tick!
		alive_neighbours_count = {}
	
		@cells.each_with_index do |cell, index|
			alive_neighbours_count[index] = cell.neighbours.alive.count
		end
	
		@cells.each_with_index do |cell, index|
			if alive_neighbours_count[index] < 2 
				cell.dead!
			end	
			
			if alive_neighbours_count[index] > 3 
				cell.dead!
			end
			
			if alive_neighbours_count[index] == 3 
				cell.alive!
			end	
		end
	end	
end
