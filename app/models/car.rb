class Car

  attr_reader :make, :model, :classification, :owner, :mechanic
  @@all = []

  def initialize(make, model, classification, owner, mechanic)
    @make = make
    @model = model
    @classification = classification
    @owner = owner
    @mechanic = mechanic
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.classifications
    self.all.map {|car| car.classification}.uniq
  end

  def mechanics
    Mechanic.all.select {|mechanic| mechanic.specialty == self.classification}
  end
end


#       Car
# "Get a list of all cars"
# "Get a list of all car classifications"
# "Get a list of mechanics that have an expertise that matches the car classification"
