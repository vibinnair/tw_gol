describe "Multiple Generations" do
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
		world.tick!
		world.tick!
		
		#world.cell_at(0,0).alive?.should be false
		#world.cell_at(1,0).alive?.should be true
		#world.cell_at(2,0).alive?.should be false
		#world.cell_at(0,1).alive?.should be false
		#world.cell_at(1,1).alive?.should be true
		#world.cell_at(2,1).alive?.should be false
		#world.cell_at(0,2).alive?.should be false
		#world.cell_at(1,2).alive?.should be true
		#world.cell_at(2,2).alive?.should be false
		
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
end
