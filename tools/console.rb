require_relative '../config/environment.rb'
require 'pry'

def reload
  load 'config/environment.rb'
end
# cars
ford = Car.new("Ford", "Escape", "SUV")
racecar = Car.new("Audi", "Prime", "exotic")
honda = Car.new("Honda", "Pilot", "SUV")

# Mechanics
bob = Mechanic.new("Bob")
fred = Mechanic.new("Fred")
ray = Mechanic.new("Ray")

# car_owners
mike = CarOwner.new("Mike")
alex = CarOwner.new("Alex")

# car methods
puts "Mike buys a car"
puts mike.buy_car(ford)
alex.buy_car(honda)
alex.buy_car(racecar)
p "___________________________________________"
puts "Get array of all car instances"
p Car.all
p "___________________________________________"
puts "Return an array of all car classifications (as strings)"
p Car.get_car_classifications 
p "___________________________________________"

# mechanic methods
bob.fix_car(honda)
bob.fix_car(ford)
ray.fix_car(racecar)

p honda.mechanic.name
p "___________________________________________"
p bob.cars_in_shop
p "___________________________________________"
p alex.cars_owned

p "___________________________________________"
p bob.call_owners
p "___________________________________________"
p bob.owners_mechanics
p "___________________________________________"
p bob.owner_names_for_mechanic
p "___________________________________________"
p alex.mechs_and_owners
p "___________________________________________"
p alex.mech_names_for_owner
p "___________________________________________"
p CarOwner.average_cars_per_owner
binding.pry
