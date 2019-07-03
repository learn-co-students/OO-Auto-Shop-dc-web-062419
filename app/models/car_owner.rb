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

  def self.list_names
    @@all.collect {|owner| owner.name}
  end

  def buy(car)
    car.owner = self
  end

  def their_cars
    Car.all.select {|car| car.owner == self}
  end

  def for_tax_purposes
    their_cars.length
  end

  @@total_owned_cars = 0.0 #not sure why this does not show up

  def self.total_owned_cars
    @@all.each {|owner| @@total_owned_cars += owner.for_tax_purposes}
    @@total_owned_cars
  end

  def self.average
    #assuming some cars may be without individual owners between sales, ownly counting owned cars 
    # @@total_owned_cars = 0
    (total_owned_cars/(self.all.length))
  end

end


