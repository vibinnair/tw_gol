require_relative "neighbours"

class Cell
	attr_accessor :x, :y, :world

	def initialize(world, x, y, state = :alive)
		@x = x
		@y = y
		@state = state
		@world = world
		@world << self		
	end
	
	def neighbours
		neighbours = Neighbours.new
	
		@world.each do |cell|
			if cell.x == @x && cell.y == @y + 1 #north
				neighbours << cell
			end 
			
			if cell.x == @x && cell.y == @y - 1 #south
				neighbours << cell
			end
			
			if cell.x == @x + 1 && cell.y == @y #east
				neighbours << cell
			end
			
			if cell.x == @x - 1 && cell.y == @y #west
				neighbours << cell
			end
			
			if cell.x == @x + 1 && cell.y == @y + 1 #north-west
				neighbours << cell
			end
			
			if cell.x == @x - 1 && cell.y == @y + 1 #north-east
				neighbours << cell
			end
			
			if cell.x == @x + 1 && cell.y == @y - 1 #south-west
				neighbours << cell
			end
			
			if cell.x == @x - 1 && cell.y == @y - 1 #south-east
				neighbours << cell
			end
		end
		
		neighbours
	end
	
	def alive!
		@state = :alive
	end 

	def dead!
		@state = :dead
	end
	
	def alive?
		@state == :alive
	end
end
