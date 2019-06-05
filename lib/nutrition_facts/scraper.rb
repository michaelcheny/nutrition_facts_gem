
class FoodScraper


  # STATIC_URL = "https://www.nutritionix.com/database/common-foods"
    
  STATIC_URL = "https://www.nutritionix.com/nixapi/search/en_US"


  # def get_page
  #   url = open(STATIC_URL)
  #   Nokogiri::HTML(url)
  # end
  
  ## scrape the first level of the website for common food name, calories, and serving size
  def self.scrape_foods
    food_items = []
    parsed_page = HTTParty.get(STATIC_URL)
    # binding.pry
    parsed_page["foods"].map do |food|
      food_items << {
      :name => food["food_name"],
      :calories_per_serving => food["nf_calories"],
      :grams_per_serving => food["serving_weight_grams"]
      }
      # binding.pry
   
    end
    food_items
    binding.pry
  end

end

# JSON.parse