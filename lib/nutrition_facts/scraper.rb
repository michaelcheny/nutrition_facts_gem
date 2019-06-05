
class FoodScraper


  # STATIC_URL = "https://www.nutritionix.com/database/common-foods"
    
  STATIC_URL = "https://www.nutritionix.com/nixapi/search/en_US"


  # def get_page
  #   url = open(STATIC_URL)
  #   Nokogiri::HTML(url)
  # end
  
  ## scrape the first level of the website for common food name, calories, and serving size
  def self.scrape_foods
    food = {}
    parsed_page = HTTParty.get(STATIC_URL)
    parsed_page["foods"].each do |food|
    binding.pry
    end
  end

end

# JSON.parse