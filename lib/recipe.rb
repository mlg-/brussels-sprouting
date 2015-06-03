class Ingredient
  attr_accessor :quantity, :unit, :name
  def initialize(quantity, unit, name)
    @quantity = quantity
    @unit = unit
    @name = name
  end

  def summary
    "#{@quantity} #{@unit} #{@name}"
  end

  def valid?
    valid_ingredients_list = ["brussels sprouts",
                              "spinach",
                              "eggs",
                              "milk",
                              "tofu",
                              "seitan",
                              "bell peppers",
                              "quinoa",
                              "kale",
                              "chocolate",
                              "beer",
                              "wine",
                              "whiskey"]
    unless valid_ingredients_list.include? name.downcase
      return false
    end
  end

  def self.parse(ingredient_string)
   quantity, unit, name = ingredient_string.match(/(\d+.+\d+)\s*(\D*\(s\))\s*(.+)/).captures
   Ingredient.new(quantity, unit, name)
  end

end

class Recipe
  attr_accessor :name, :instructions, :ingredients

  def initialize(name, instructions, ingredients)
    @name = name
    @instructions = instructions
    @ingredients = ingredients
  end

  def summary
    summary = "\nName: #{@name}\n\n Ingredients\n"

    @ingredients.each do |ingredient|
      summary += "- #{ingredient.summary}\n"
    end

    summary += "\n Instructions\n"
    i = 0
    @instructions.each do |instruction|
      i += 1
      summary += "#{i}. #{instruction}\n"
    end

    summary
  end

  def contains_allergens?
    ingredient_safety = []
    ingredients.each do |ingredient|
      if ingredient.valid? == false
        ingredient_safety << false
      else
        ingredient_safety << true
      end
    end
    if ingredient_safety.include? false
      return true
    else
      return false
    end
  end

end
