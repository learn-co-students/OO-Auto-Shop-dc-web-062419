require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

bob = CarOwner.new("Bob")
sally = CarOwner.new("Sally")
jane = CarOwner.new("Jane")

joe = Mechanic.new("Joe","vintage")
amy = Mechanic.new("Amy","exotic")
carrie = Mechanic.new("Carrie","exotic")
herb = Mechanic.new("Herb","clunker")

bently = Car.new("Bently","Continental GT","vintage",bob,joe)
aston_martin = Car.new("Aston Martin","V8 Vantage","vintage",sally,joe)
audi = Car.new("Audi","A6","exotic",bob,amy)
bmw = Car.new("BMW","M3","exotic",jane,amy)
ford = Car.new("Ford","Explorer","clunker",bob,herb)
gm = Car.new("GM","Cobalt","clunker",jane,herb)
mazda = Car.new("Mazda","Mazda 3","exotic",sally,carrie)


#       CarOwner
p "Get a list of all owners"
p CarOwner.all == [bob,sally,jane]
p "Get a list of all the cars that a specific owner has"
p bob.cars == [bently,audi,ford]
p sally.cars == [aston_martin,mazda]
p jane.cars == [bmw,gm]
p "Get a list of all the mechanics that a specific owner goes to"
p bob.mechanics == [joe,amy,herb]
p sally.mechanics == [joe,carrie]
p jane.mechanics == [amy,herb]
p "Get the average amount of cars owned for all owners"
p CarOwner.average_number_cars == (3+2+2).to_f/3
#       Car
p "Get a list of all cars"
p Car.all == [bently,aston_martin,audi,bmw,ford,gm,mazda]
p "Get a list of all car classifications"
p Car.classifications == ["vintage","exotic","clunker"]
p "Get a list of mechanics that have an expertise that matches the car classification"
p bently.mechanics == [joe]
p bmw.mechanics == [amy,carrie]
#       Mechanic
p "Get a list of all mechanics"
p Mechanic.all == [joe,amy,carrie,herb]
p "Get a list of all cars that a mechanic services"
p joe.cars == [bently,aston_martin]
p amy.cars == [audi,bmw]
p "Get a list of all the car owners that go to a specific mechanic"
p carrie.owners == [sally]
p herb.owners == [bob,jane]
p "Get a list of the names of all car owners who go to a specific mechanic"
p carrie.owner_names == ["Sally"]
p herb.owner_names == ["Bob","Jane"]

# binding.pry
