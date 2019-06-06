
class FoodScraper


  # STATIC_URL = "https://www.nutritionix.com/database/common-foods"
    
  # STATIC_URL = "https://www.nutritionix.com/nixapi/search/en_US"


  
  ## scrape the first level of the website for common food name, calories, and serving size
  # def self.scrape_foods
  #   food_database_url = "https://www.nutritionix.com/nixapi/search/en_US"
  #   parsed_page = HTTParty.get(food_database_url)

  #   food_items = []
  #   page = 1
  #   items_per_page = parsed_page["foods"].count
  #   total_items = parsed_page["total"]
  #   last_page = (total_items.to_f / items_per_page.to_f).ceil  
  #   while page <= last_page
  #     pagination_url = "https://www.nutritionix.com/nixapi/search/en_US?page=#{page}"

  #     puts pagination_url
  #     puts "Page: #{page}"

  #     pagination_parsed_page = HTTParty.get(pagination_url)

  #     pagination_parsed_page["foods"].map do |food|
  #       food_items << {
  #       :name => food["food_name"],
  #       :calories_per_serving => food["nf_calories"],
  #       :grams_per_serving => food["serving_weight_grams"]
  #       }
  #       puts "Added #{food["food_name"]}"
  #       puts ""
  #     end
  #     page += 1
  #   end
  #   # binding.pry
  #   food_items
  # end


  # def self.scrape_foods
  #   food_items = []
  #   parsed_page = HTTParty.get("https://www.nutritionix.com/nixapi/search/en_US")
  #   # binding.pry
  #   parsed_page["foods"].map do |food|

  #     ## get rid of leading and trailing whitespace to use as item url
  #     url_string_add = "#{food["food_name"]}".delete("0-9%").gsub(/^[ \t]+|[ \t]+$/, "")

  #     food_items << {
  #     :name => food["food_name"],
  #     :calories_per_serving => food["nf_calories"],
  #     :grams_per_serving => food["serving_weight_grams"],
  #     :url => "https://www.nutritionix.com/food/#{url_string_add}".gsub(" ", "-")
  #     }
  #   end
  #   food_items
  #   binding.pry
  # end
  
  def self.scrape_foods
    food_items = []
    parsed_page = HTTParty.get("https://www.nutritionix.com/nixapi/search/en_US")
    # binding.pry
    parsed_page["foods"].each do |food|
      name = food["food_name"]
      calories_per_serving = food["nf_calories"]
      grams_per_serving = food["serving_weight_grams"]
      ## get rid of leading and trailing whitespace to use as item url
      end_of_url = "#{food["food_name"]}".delete("0-9%").gsub(/^[ \t]+|[ \t]+$/, "")
      url = "https://www.nutritionix.com/food/#{end_of_url}".gsub(" ", "-")
      Food.new(name, calories_per_serving, grams_per_serving, url)
    end
    binding.pry
  end


end

# JSON.parse