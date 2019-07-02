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
  def buy_car(car)
    car.car_owner = self
  end

  def cars_owned
    Car.all.select do |car|
      car.car_owner == self
    end
  end
  def mechs_and_owners
    owns = Car.all.select{|car| car.car_owner == self}
    owns.map {|car| car.mechanic}
  end

  def mech_names_for_owner
    mechs_and_owners.map {|mech| mech.name}
  end

  def self.average_cars_per_owner
    num_cars = Car.all.count
    num_owners = CarOwner.all.count
    (num_cars /  num_owners.to_f).round(2)
  end
end
