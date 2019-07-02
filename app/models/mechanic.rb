require "pry"

class Mechanic

  attr_reader :name
  @@all = []

def initialize(name)
  @name = name
  # @specialty = specialty
  self.class.all << self
end
 def self.all
  @@all
 end

 def fix_car(car)
  car.mechanic = self
 end

 def cars_in_shop
  Car.all.select do |car|
    car.mechanic == self
  end
 end

def call_owners
  self.cars_in_shop.each do |car|
    puts "Hey fool #{car.car_owner.name} your car was stolen! Do you have insurance?"
  end 
  end 

def owners_mechanics
  car_mech = Car.all.select {|car| car.mechanic == self}
  car_mech.map {|car| car.car_owner}
end

def owner_names_for_mechanic
  owners_mechanics.map {|owner| owner.name}
end





end
