class Mechanic

  attr_reader :name, :specialty
  @@all = []

  def initialize(name, specialty)
    @name = name
    @specialty = specialty
    self.class.all << self
  end

  def self.all
    @@all
  end

  def cars
    Car.all.select {|car| car.mechanic == self}
  end

  def owners
    cars.map {|car| car.owner}
  end

  def owner_names
    owners.map {|owner| owner.name}
  end

end


#       Mechanic
# "Get a list of all mechanics"
# "Get a list of all cars that a mechanic services"
# "Get a list of all the car owners that go to a specific mechanic"
# "Get a list of the names of all car owners who go to a specific mechanic"
