require './route'
require './drive_route'

describe Route do
  
  before(:all) do
    
    @driving_route = DriveRoute.new("923 Market St., San Francisco, CA", "1703 Telegraph Avenue, Oakland, CA")
    
    origin = "923 Market St. SF, CA"
    destination = "100 California St. SF, CA"
    destination2 = "1703 Telegraph Avenue, Oakland, CA"
    
    
    @route1 = Route.new(origin,destination,150,100)
    @route2 = Route.new(origin,destination,150,100)
    @route3 = Route.new(origin,destination2,100,100)
    @route4 = Route.new(origin,destination,100,300)
    @route5 = @route1.add(@route3)
  end
  
  describe "#add" do
    it "should add two routes' cost and time as a new route object" do
      @route5.should be_an_instance_of Route
    end
    
    it "when added should return the total time" do
      @route5.time_in_seconds.should == @route1.time_in_seconds + @route3.time_in_seconds
    end
    
    it "when added should return the total cost" do
      @route5.cost_in_pennies.should == @route1.cost_in_pennies + @route3.cost_in_pennies
    end
    
  end
  
end