class NutritionFacts::CLI

  def call
    self.greeting
  end

  def greeting
    puts ""
    puts "testing"
    puts "Welcome"
    puts "we're gonna scrape this site for the nutritional values of foods"
    puts "https://www.nutritionix.com/database/common-foods"
    puts "stay put, these are just placeholder texts"
    puts ""
  end

end