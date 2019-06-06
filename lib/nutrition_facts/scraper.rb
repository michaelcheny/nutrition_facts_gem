
class FoodScraper


  # STATIC_URL = "https://www.nutritionix.com/database/common-foods"
    
  # STATIC_URL = "https://www.nutritionix.com/nixapi/search/en_US"


  
    ## scrape the first level of the website for common food name, calories, and serving size, url
  def self.scrape_foods

      ## parsing (eventually give this it's own method)
    food_database_url = "https://www.nutritionix.com/nixapi/search/en_US"
    parsed_page = HTTParty.get(food_database_url)

      ## page 1 in the loop
    page = 1

      ## variables to make loop possible
    items_per_page = parsed_page["foods"].count
    total_items = parsed_page["total"]
    last_page = (total_items.to_f / items_per_page.to_f).ceil  

      ## start a loop to parse every page
    while page <= last_page
      pagination_url = "https://www.nutritionix.com/nixapi/search/en_US?page=#{page}"

        ## Status/Progress bar
      puts pagination_url
      puts "Page: #{page}/#{last_page}"
        ## eventually change this to a quote generator "patients is a gift blah blah"
      puts "Hang in there bud, go grab a drink and come back in 3 minutes"

      pagination_parsed_page = HTTParty.get(pagination_url)

        ## iterate over each food item and create objects out of their information
      pagination_parsed_page["foods"].each do |food|

        name = food["food_name"]
        calories_per_serving = food["nf_calories"]
        grams_per_serving = food["serving_weight_grams"]
          ## get rid of leading and trailing whitespace to use as item url
        end_of_url = "#{food["food_name"]}".delete("0-9%").gsub(/^[ \t]+|[ \t]+$/, "")
        url = "https://www.nutritionix.com/food/#{end_of_url}".gsub(" ", "-")

        Food.new(name, calories_per_serving, grams_per_serving, url)

          ## visual progress so user's won't think their computer crash
        puts "Added #{food["food_name"]}"
        puts ""
      end

        ## next page
      page += 1
    end
    binding.pry
    
  end

  
  # def self.scrape_foods
  #   parsed_page = HTTParty.get("https://www.nutritionix.com/nixapi/search/en_US")
  #   # binding.pry
  #   parsed_page["foods"].each do |food|
  #     name = food["food_name"]
  #     calories_per_serving = food["nf_calories"]
  #     grams_per_serving = food["serving_weight_grams"]
  #     ## get rid of leading and trailing whitespace to use as item url
  #     end_of_url = "#{food["food_name"]}".delete("0-9%").gsub(/^[ \t]+|[ \t]+$/, "")
  #     url = "https://www.nutritionix.com/food/#{end_of_url}".gsub(" ", "-")

  #     Food.new(name, calories_per_serving, grams_per_serving, url)
  #   end
  #   binding.pry
  # end


end

# JSON.parse