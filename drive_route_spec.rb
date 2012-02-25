require './route'
require './drive_route'



describe 'DriveRoute' do
    before(:each) do
      @origin = "923 Market St., San Francisco, CA"
      @destination = "1703 Telegraph Avenue, Oakland, CA"
      @driving_route = DriveRoute.new(@origin, @destination)  
     end

    it "when passed a driving route, returns a route object" do
      google_directions = File.open("json_cached_output1.json").read
      GoogleDirectionsWrapper = double('DriveRoute::GoogleDirectionsWrapper')
      GoogleDirectionsWrapper.stub!(:new).with(@origin, @destination).and_return (google_directions.to_s)
      @driving_route.should be_an_instance_of DriveRoute
      @driving_route.origin.should be_an_instance_of String
      @driving_route.destination.should be_an_instance_of String
      @driving_route.cost_in_pennies.should be_an_instance_of Fixnum
      @driving_route.time_in_seconds.should be_an_instance_of Fixnum
    end
    
    it "returns proper input for a test drive route" do
      @driving_route.origin.should == "923 Market St., San Francisco, CA"
      @driving_route.destination.should == "1703 Telegraph Avenue, Oakland, CA"
      @driving_route.cost_in_pennies.should be_within(10).of(174)
      @driving_route.time_in_seconds.should == 1140
    end

end
