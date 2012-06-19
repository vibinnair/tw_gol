require_relative "../cell"
require_relative "../world"

describe "Cell" do
	before(:each) do
		@world = World.new
		@cell = Cell.new(@world, 1,1)
	end
	
	it "should store its x - position" do
		@cell.x.should == 1
	end
	
	it "should store its y - position" do
		@cell.y.should == 1
	end
	
	it "should store the world to which it belongs" do
		@cell.world.should == @world
	end
	
	it "should add itself to the world on creation" do
		@world.cell_at(1,1).should be @cell
	end	 
	
	it "should be alive by default" do
		@cell.alive?.should be true 
	end

	it "should return its state as alive when alive" do 
		@cell.alive!
		@cell.alive?.should == true 
	end 
	
	it "should return its state as not alive when dead" do
		@cell.dead!
		@cell.alive?.should == false
	end
	
	context "Neighbours" do	
		it "detects the neighbour to its north" do
			Cell.new(@world, 1, 2)
			@cell.neighbours.count.should == 1
		end 
		
		it "detects the neighbour to its south" do
			Cell.new(@world, 1, 0)
			@cell.neighbours.count.should == 1
		end
		
		it "detects the neighbour to its east" do
			Cell.new(@world, 2, 1)
			@cell.neighbours.count.should == 1 
		end	 
		
		it "detects the neighbour to its west" do
			Cell.new(@world, 0, 1)
			@cell.neighbours.count.should == 1
		end
		
		it "detects the neighbour to its north-west" do
			Cell.new(@world, 2, 2)
			@cell.neighbours.count.should == 1
		end	
		
		it "detects the neighbour to its north-east" do
			Cell.new(@world, 0, 2)
			@cell.neighbours.count.should == 1
		end
			
		it "detects the neighbour to its south- west" do
			Cell.new(@world, 2, 0)
			@cell.neighbours.count.should == 1
		end
		
		it "detects the neighbour to its south-east" do
			Cell.new(@world, 0, 0)
			@cell.neighbours.count.should == 1
		end
		
		it "returns its current neighbours" do
			Cell.new(@world, 0, 0, :alive)
			Cell.new(@world, 1, 0, :alive)
			Cell.new(@world, 0, 1, :dead)
			
			@cell.neighbours.count.should == 3
		end	
	end
end
