require 'pry'

class Car

  attr_reader :make, :model, :classification
  attr_accessor :car_owner, :mechanic
  @@all = []

  def initialize(make, model, classification)
    @make = make
    @model = model
    @classification = classification
    self.class.all << self
  end
  
  def self.all
    @@all
  end

  def self.get_car_classifications
    cars_resp = @@all.map do |car|
      car.classification
    end
  end



end
