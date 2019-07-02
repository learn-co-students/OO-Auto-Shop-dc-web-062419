class CarOwner

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def cars
    Car.all.select {|car| car.owner == self}
  end

  def mechanics
    cars.map {|car| car.mechanic}
  end

  def self.average_number_cars
    Car.all.size.to_f / self.all.size
  end
end


#       CarOwner
# "Get a list of all owners"
# "Get a list of all the cars that a specific owner has"
# "Get a list of all the mechanics that a specific owner goes to"
# "Get the average amount of cars owned for all owners"
