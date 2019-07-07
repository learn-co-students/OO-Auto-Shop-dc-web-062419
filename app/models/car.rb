class Car

  attr_reader :make, :model
  
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

end
