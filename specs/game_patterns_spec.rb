require_relative "../world"
require_relative "../cell"

describe "Game Patterns" do
	it "should pass the block pattern" do
		world = World.new
		Cell.new(world, 0,0, :alive)
		Cell.new(world, 1,0, :alive)
		Cell.new(world, 1,1, :alive)
		Cell.new(world, 0,1, :alive)
		
		world.tick!
		
		world.cell_at(0,0).alive?.should be true
		world.cell_at(1,0).alive?.should be true
		world.cell_at(1,1).alive?.should be true
		world.cell_at(0,1).alive?.should be true
	end
	
	it "should pass the boat pattern" do
		world = World.new
		Cell.new(world, 0,0, :dead)
		Cell.new(world, 1,0, :alive)
		Cell.new(world, 2,0, :dead)
		Cell.new(world, 0,1, :alive)
		Cell.new(world, 1,1, :dead)
		Cell.new(world, 2,1, :alive)
		Cell.new(world, 0,2, :alive)
		Cell.new(world, 1,2, :alive)
		Cell.new(world, 2,2, :dead)
		
		world.tick!
		
		world.cell_at(0,0).alive?.should be false
		world.cell_at(1,0).alive?.should be true
		world.cell_at(2,0).alive?.should be false
		world.cell_at(0,1).alive?.should be true
		world.cell_at(1,1).alive?.should be false
		world.cell_at(2,1).alive?.should be true
		world.cell_at(0,2).alive?.should be true
		world.cell_at(1,2).alive?.should be true
		world.cell_at(2,2).alive?.should be false
	end
	
	it "should pass the blinker pattern" do
		world = World.new
		Cell.new(world, 0,0, :dead)
		Cell.new(world, 1,0, :alive)
		Cell.new(world, 2,0, :dead)
		Cell.new(world, 0,1, :dead)
		Cell.new(world, 1,1, :alive)
		Cell.new(world, 2,1, :dead)
		Cell.new(world, 0,2, :dead)
		Cell.new(world, 1,2, :alive)
		Cell.new(world, 2,2, :dead)
		
		world.tick!
		
		world.cell_at(0,0).alive?.should be false
		world.cell_at(1,0).alive?.should be false
		world.cell_at(2,0).alive?.should be false
		world.cell_at(0,1).alive?.should be true
		world.cell_at(1,1).alive?.should be true
		world.cell_at(2,1).alive?.should be true
		world.cell_at(0,2).alive?.should be false
		world.cell_at(1,2).alive?.should be false
		world.cell_at(2,2).alive?.should be false
	end
	
	it "should pass the toad pattern" do
		world = World.new
		Cell.new(world, 0,0, :dead)
		Cell.new(world, 1,0, :dead)
		Cell.new(world, 2,0, :dead)
		Cell.new(world, 3,0, :dead)	
		Cell.new(world, 0,1, :alive)
		Cell.new(world, 1,1, :alive)
		Cell.new(world, 2,1, :alive)
		Cell.new(world, 3,1, :dead)
		Cell.new(world, 0,2, :dead)
		Cell.new(world, 1,2, :alive)
		Cell.new(world, 2,2, :alive)
		Cell.new(world, 3,2, :alive)		
		Cell.new(world, 0,3, :dead)
		Cell.new(world, 1,3, :dead)
		Cell.new(world, 2,3, :dead)
		Cell.new(world, 3,3, :dead)		
		
		world.tick!
		
		world.cell_at(0,0).alive?.should be false
		world.cell_at(1,0).alive?.should be true
		world.cell_at(2,0).alive?.should be false
		world.cell_at(3,0).alive?.should be false
		world.cell_at(0,1).alive?.should be true
		world.cell_at(1,1).alive?.should be false
		world.cell_at(2,1).alive?.should be false
		world.cell_at(3,1).alive?.should be true
		world.cell_at(0,2).alive?.should be true
		world.cell_at(1,2).alive?.should be false
		world.cell_at(2,2).alive?.should be false
		world.cell_at(3,2).alive?.should be true
		world.cell_at(0,3).alive?.should be false
		world.cell_at(1,3).alive?.should be false
		world.cell_at(2,3).alive?.should be true
		world.cell_at(3,3).alive?.should be false
	end
end
