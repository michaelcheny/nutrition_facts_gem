class Food

  @@all = []

  attr_reader :name, :calories_per_serving, :grams_per_serving,

  def initialize(name, calories_per_serving, grams_per_serving)

    @name = name
    @calories_per_serving = calories_per_serving
    @grams_per_serving = grams_per_serving
    @@all << self

  end

  def self.all
    @@all
  end

end