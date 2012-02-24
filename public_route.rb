require './bart_directory'
require './route'
require './bart_route'
require './walk_route'

class PublicRoute < Route
  
  attr_reader :closest_bart_to_destination
  
  def initialize(origin, destination)
    
    @directory = BartDirectory.new
    @origin = origin
    @destination = destination
    
    closest_bart_station_to_origin = @directory.closest_station(origin) 
    closest_bart_station_to_destination = @directory.closest_station(destination)
    puts closest_bart_station_to_destination
    
    if closest_bart_station_to_origin == closest_bart_station_to_destination
      return WalkRoute.new(origin,destination)
    else
      
      start_walk_route = WalkRoute.new(origin, closest_bart_station_to_origin)
      puts start_walk_route.time_in_seconds
        # returns an object: route_time(a time integer)
      bart_route = BartRoute.new(closest_bart_station_to_origin, closest_bart_station_to_destination)
      puts bart_route.time_in_seconds
      
        # returns an object: cost_in_pennies(a cost integer)
      end_walk_route = WalkRoute.new(closest_bart_station_to_destination, destination)
      puts end_walk_route.time_in_seconds
      
        # returns an object: route_time(a time integer)
      total_route = start_walk_route.add(bart_route.add(end_walk_route))
      # self = start_walk_route.add(bart_route.add(end_walk_route))
        # returns an object: new route
      # p total_route.time_in_seconds
       @time_in_seconds = total_route.time_in_seconds
      # p total_route.cost_in_pennies
       @cost_in_pennies = total_route.cost_in_pennies
      #total_route
    end
    
  end
  
end

#should put initialize functions into factory methods