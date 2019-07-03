class Mechanic

  @@all = []

  attr_reader :name, :specialty

def initialize(name, specialty)
  @name = name
  @specialty = specialty
  self.class.all << self
end

def self.all
  @@all
end

#in this garage, a mechanic may work on cars that are outside their specialty. This method represents when a mechanic works on any car.
def fixes_car(car)
  car.mechanic = self
end

#cars that this mechanic would be the expert on, whether they are currently assigned to work on them car or not
def cars_they_specialize_in
  Car.all.select {|car| car.classification == @specialty }
end

#returns a list of cars worked on by this mechanic
def cars_they_work_on
  Car.all.select {|car| car.mechanic == self } 
end

def self.report_on_references
  self.all.each {|grease_monkey| 
  puts "#{(grease_monkey.cars_they_work_on.map {|car| car.owner.name }).join(" & ")} hires #{grease_monkey.name} when they want to get #{(grease_monkey.cars_they_work_on.map {|car| car.name }).join(" or ")} fixed. " }

end


def their_references
  (self.cars_they_work_on.map {|car| car.owner.name}).join(" & ")
end

end
