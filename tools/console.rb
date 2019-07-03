require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#data
heidi = Car.new("Heidi", "Ford", "Escort", "Budget")
josie = Car.new("Josie", "Volkes", "Cabrio", "Antique")
imogen = Car.new("Imogen", "Ford", "Focus", "Budget")
stella = Car.new("Stella", "Hyundai", "Veloster", "NewFangled")
howard = Car.new("Howard", "Ford", "Aerostar", "Antique")
ingrid = Car.new("Ingrid", "Volvo", "C30", "Sports")
ursula = CarOwner.new("Ursula")
craig = CarOwner.new("Craig")
chris = CarOwner.new("Chris")
conrad = CarOwner.new("Conrad")
ursula.buy(heidi)
craig.buy(josie)
chris.buy(imogen)
conrad.buy(heidi)
ursula.buy(stella)
chris.buy(howard)
craig.buy(ingrid)
billybob = Mechanic.new("BillyBob", "Antique")
billyjoe = Mechanic.new("BillyJoe", "Budget")
billyjolene = Mechanic.new("BillyJolene", "NewFangled")
jellybob = Mechanic.new("JellyBob", "Sports")
jellybob.fixes_car(heidi)
billyjolene.fixes_car(stella)
billyjolene.fixes_car(ingrid)
billybob.fixes_car(howard)
billyjoe.fixes_car(imogen)

puts "-----------------------"
# Get a list of all owners
p CarOwner.all
p CarOwner.list_names
puts "Does this list include 'chris' and the name 'Chris'?"
p CarOwner.all.include?(chris)
p CarOwner.list_names.include?("Chris")

puts "-----------------------"
# Get a list of all the cars that a specific owner has
p ursula.their_cars
puts "Does the method 'their_cars' list include 'stella' for owner 'ursula'?"
ursula.their_cars.each {|car| puts car.name }
puts ursula.their_cars.include?(stella) 


# Get a list of all the mechanics that a specific owner goes to


puts "-----------------------"
# Get the average amount of cars owned for all owners
CarOwner.all.each {|owner| puts "#{owner.name} owns #{owner.for_tax_purposes} cars: #{(owner.their_cars.map {|car| p car.model })}" }
puts "The average person owns #{CarOwner.average} car(s)."

puts "-----------------------"
#Car
# Get a list of all cars
# Note: The data in this set may look weird, but these are all cars my family has owned and named as such, with these human-sounding names.
puts "These are all the car instances:"
p Car.all 
puts "They include #{Car.list}"


puts "-----------------------"
# Get a list of all car classifications
puts "These are the kinds of cars that exist in this universe: #{Car.classes}"


puts "-----------------------"
# Get a list of mechanics that have an expertise that matches the car classification
# Assuming the query is "which mechanic would be the best to work on this car:"
Car.all.each {|car| car.who_best }

puts "-----------------------"
#Mechanic class
# Get a list of all mechanics
puts "these are all the mechanics:" 
Mechanic.all

puts "-----------------------"
# Get a list of all cars that a mechanic services
Mechanic.all.each {|grease_monkey| puts "#{grease_monkey.name} is currently assigned to work on #{(grease_monkey.cars_they_work_on.map {|car| car.name }).join(" & ")}"}

puts "-----------------------"
# Get a list of all the car owners that go to a specific mechanic
# Mechanic.all.each {|grease_monkey| 
#   puts "#{(grease_monkey.cars_they_work_on.map {|car| car.owner.name }).join(" & ")} hires #{grease_monkey.name} when they want to get #{(grease_monkey.cars_they_work_on.map {|car| car.name }).join(" or ")} fixed. " }
Mechanic.report_on_references

puts "-----------------------"
# Get a list of the names of all car owners who go to a specific mechanic
puts billybob.their_references



# binding.pry