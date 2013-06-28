require 'airport'
require 'plane'
 
# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land
describe Airport do
  let(:airport) { Airport.new }
  
  context 'taking off and landing' do
    it 'a plane can land' do
        plane = double :plane
        plane.should_receive(:land!)
        airport.order_landing!(plane)
    end
    
    it 'a plane can take off' do
        plane = double :plane
        plane.should_receive(:take_off!)
        airport.order_take_off!(plane)
    end
  end
  
  context 'traffic control' do
##added test for airport not full by default
  it "airport is not full by default" do
    airport.should_not be_full
  end

##added test for airport is full if capacity of 5 planes is reached
##capacity is hard coded as 5 planes (it's a small airport!)
  context "full airport" do
    let(:full_airport){ Airport.new [:plane, :plane, :plane, :plane, :plane] }
      
      it "airport is full if it is at capacity, i.e. has 5 planes" do
        full_airport.should be_full
      end
      
      it 'plane cannot land if the airport is full' do
        plane = double :plane
        plane.should_not_receive(:land!)
        full_airport.should be_full
        full_airport.order_landing!(plane)
      end

  end #end of full airport context

    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    context 'weather conditions' do

      ###added test to say that the airport has a weather condition that is either sunny or stormy
      xit "airport has a random weather condition which is sunny when the number is 1" do
        airport.weather.stub(:rand).with(2).and_return(1)
        airport.weather.should eq "sunny"
      end

      it 'a plane cannot take off when there is a storm brewing' do
      end
      
      it 'a plane cannot land in the middle of a storm' do
      end
    end
  end
end
 
# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"
describe Plane do
 
  let(:plane) { Plane.new }
  
  it 'has a flying status when created' do
    plane.status.should eq "flying"
  end
##it must be in the air when it is created, hence flying status and in_the_air is true
  it 'has a flying status when in the air' do
      plane.should be_in_the_air
      plane.status.should eq "flying"
  end

##added new test to see if plane can land
  it 'can land' do
    plane.land!
    plane.should_not be_in_the_air
    plane.status.should eq "landed"
  end

##created attr_accessor to assign in_the_air as false for this test
 context "landed plane" do
  let(:landed_plane){Plane.new}
  it 'can take off' do
    landed_plane.in_the_air = false
    landed_plane.should_not be_in_the_air
    landed_plane.take_off!
    landed_plane.in_the_air?.should be_true
  end
  
  it 'changes its status to flying after taking of' do
    landed_plane.in_the_air = false
    landed_plane.status.should eq "landed"
    landed_plane.take_off!
    landed_plane.status.should eq "flying"
  end
end

end #end of context landed plane
 
# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!
describe "The gand finale (last spec)" do
  it 'all planes can land and all planes can take off' do
  end
end