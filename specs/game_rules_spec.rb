require_relative "../cell"
require_relative "../world"

	describe "Game Of Life" do
		context "A Live Cell" do
			before(:each) do
					@world = World.new
					@cell = Cell.new(@world, 1,1, :alive)
			end
			
			it "should die if it has no live neighbour" do
				Cell.new(@world, 0,0, :dead)
				Cell.new(@world, 1,0, :dead)
				Cell.new(@world, 0,1, :dead)
				@world.tick!
				@cell.alive?.should be false
			end
			
			it "should die if it has one live neighbour" do
				Cell.new(@world, 0,0, :alive)
				Cell.new(@world, 1,0, :dead)
				Cell.new(@world, 0,1, :dead)
				@world.tick!
				@cell.alive?.should be false
			end
			
			it "should survive if it has two live neighbours" do
				Cell.new(@world, 0,0, :alive)
				Cell.new(@world, 1,0, :alive)
				Cell.new(@world, 0,1, :dead)
				@world.tick!
				@cell.alive?.should be true
			end
					
			it "should survive if it has three live neighbours" do
				Cell.new(@world, 0,0, :alive)
				Cell.new(@world, 1,0, :alive)
				Cell.new(@world, 0,1, :alive)
				@world.tick!
				@cell.alive?.should be true
			end
			
			it "should die if it has four live neighbours" do
				Cell.new(@world, 0,0, :alive)
				Cell.new(@world, 1,0, :alive)
				Cell.new(@world, 2,0, :alive)
				Cell.new(@world, 0,1, :alive)
				Cell.new(@world, 2,1, :dead)
				Cell.new(@world, 0,2, :dead)
				Cell.new(@world, 1,2, :dead)
				Cell.new(@world, 2,2, :dead)
				@world.tick!
				@cell.alive?.should be false
			end
		end
		
		context "A Dead Cell" do
			before(:each) do
					@world = World.new
					@cell = Cell.new(@world, 1,1, :dead)
			end
			
			it "should be dead if it has no live neighbours" do
				Cell.new(@world, 0,0, :dead)
				Cell.new(@world, 1,0, :dead)
				Cell.new(@world, 0,1, :dead)
				@world.tick!
				@cell.alive?.should be false
			end
			
			it "should be dead if it has one live neighbours" do
				Cell.new(@world, 0,0, :alive)
				Cell.new(@world, 1,0, :dead)
				Cell.new(@world, 0,1, :dead)
				@world.tick!
				@cell.alive?.should be false
			end
			
			it "should be dead if it has two live neighbours" do
				Cell.new(@world, 0,0, :alive)
				Cell.new(@world, 1,0, :alive)
				Cell.new(@world, 0,1, :dead)
				@world.tick!
				@cell.alive?.should be false
			end
			
			it "should be alive if it has three live neighbours" do
				Cell.new(@world, 0,0, :alive)
				Cell.new(@world, 1,0, :alive)
				Cell.new(@world, 0,1, :alive)
				@world.tick!
				@cell.alive?.should be true
			end
			
			it "should be dead if it has four live neighbours" do
				Cell.new(@world, 0,0, :alive)
				Cell.new(@world, 1,0, :alive)
				Cell.new(@world, 2,0, :alive)
				Cell.new(@world, 0,1, :alive)
				Cell.new(@world, 2,1, :dead)
				Cell.new(@world, 0,2, :dead)
				Cell.new(@world, 1,2, :dead)
				Cell.new(@world, 2,2, :dead)
				@world.tick!
				@cell.alive?.should be false
			end
		end	
	end
