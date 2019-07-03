class Car

  attr_reader :make, :model, :name, :classification
  attr_accessor :owner, :mechanic

  @@all = []

  def initialize(name, make, model, classification)
    @name = name
    @make = make
    @model = model
    @classification = classification
    self.class.all << self
  end

  # def owner
  #   @owner = owner
  # end

  def self.all
    @@all
  end

def self.list
  p self.all.map {|item| item.name }
end


def self.classes
  p self.all.map {|item| item.classification }
end


def who_best
  best_mechanic = Mechanic.all.select {|grease_monkey| grease_monkey.specialty == @classification }
  puts "#{best_mechanic[0].name.to_s} would be the specialist for the car #{self.name} since is classified as #{self.classification}"
  best_mechanic
end

end

