class NutritionFacts::FoodScraper

  STATIC_URL = "https://www.nutritionix.com/database/common-foods"

  

  def self.scrape_foods
    url = open(STATIC_URL)
    binding.pry
  end

end