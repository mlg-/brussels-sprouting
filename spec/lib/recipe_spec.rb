require_relative "../../lib/recipe"

describe Recipe do
  describe '#summary' do
    context 'when the recipe is quinoa salad' do
      it 'returns the fully formatted recipe' do
        quinoa_name = "Zesty Quinoa Salad"
        quinoa_ingredients = [
          Ingredient.new(1.0, "cup", "Quinoa"),
          Ingredient.new(2.0, "cup(s)", "Water"),
          Ingredient.new(0.25, "cup", "Extra Virgin Olive Oil"),
          Ingredient.new(2.0, "", "Limes, Juiced"),
          Ingredient.new(2.0, "teaspoons", "Ground Cumin"),
          Ingredient.new(1.0, "teaspoon", "Salt"),
          Ingredient.new(0.5, "teaspoon", "Red Pepper Flakes"),
          Ingredient.new(1.5, "cups", "Halved Cherry Tomatoes"),
          Ingredient.new(15.0, "oz", "Black Beans"),
          Ingredient.new(5.0, "", "Green Onions Finely Chopped"),
          Ingredient.new(0.25, "cup", "Fresh Cilantro")
        ]
        quinoa_instructions = [
          "Bring quinoa and water to a boil in a saucepan.",
          "Reduce heat to medium-low, cover, and simmer until quinoa is tender and water has been absorbed, 10 to 15 minutes.",
          "Set aside to cool.",
          "Whisk olive oil, lime juice, cumin, 1 teaspoon salt, and red pepper flakes together in a bowl.",
          "Combine quinoa, tomatoes, black beans, and green onions together in a bowl.",
          "Pour dressing over quinoa mixture; toss to coat.",
          "Stir in cilantro; season with salt and black pepper.",
          "Serve immediately or chill in refrigerator."
        ]
        quinoa_recipe = Recipe.new(quinoa_name, quinoa_instructions, quinoa_ingredients)
        recipe_string = "\nName: Zesty Quinoa Salad\n\n Ingredients\n- 1.0 cup Quinoa\n- 2.0 cup(s) Water\n- 0.25 cup Extra Virgin Olive Oil\n- 2.0  Limes, Juiced\n- 2.0 teaspoons Ground Cumin\n- 1.0 teaspoon Salt\n- 0.5 teaspoon Red Pepper Flakes\n- 1.5 cups Halved Cherry Tomatoes\n- 15.0 oz Black Beans\n- 5.0  Green Onions Finely Chopped\n- 0.25 cup Fresh Cilantro\n\n Instructions\n1. Bring quinoa and water to a boil in a saucepan.\n2. Reduce heat to medium-low, cover, and simmer until quinoa is tender and water has been absorbed, 10 to 15 minutes.\n3. Set aside to cool.\n4. Whisk olive oil, lime juice, cumin, 1 teaspoon salt, and red pepper flakes together in a bowl.\n5. Combine quinoa, tomatoes, black beans, and green onions together in a bowl.\n6. Pour dressing over quinoa mixture; toss to coat.\n7. Stir in cilantro; season with salt and black pepper.\n8. Serve immediately or chill in refrigerator.\n"
        expect(quinoa_recipe.summary).to eq (recipe_string)
      end
    end

    context 'when the recipe is quinoa salad' do
      it 'returns the fully formatted recipe' do
      name = "Roasted Brussels Sprouts"
      ingredients = [
          Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
          Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
          Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
          Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
        ]
      instructions = [
          "Preheat oven to 400 degrees F.",
          "Cut off the brown ends of the Brussels sprouts.",
          "Pull off any yellow outer leaves.",
          "Mix them in a bowl with the olive oil, salt and pepper.",
          "Pour them on a sheet pan and roast for 35 to 40 minutes.",
          "They should be until crisp on the outside and tender on the inside.",
          "Shake the pan from time to time to brown the sprouts evenly.",
          "Sprinkle with more kosher salt ( I like these salty like French fries).",
          "Serve and enjoy!"
        ]
      recipe = Recipe.new(name, instructions, ingredients)
      recipe_string = "\nName: Roasted Brussels Sprouts\n\n Ingredients\n- 1.5 lb(s) Brussels sprouts\n- 3.0 tbspn(s) Good olive oil\n- 0.75 tspn(s) Kosher salt\n- 0.5 tspn(s) Freshly ground black pepper\n\n Instructions\n1. Preheat oven to 400 degrees F.\n2. Cut off the brown ends of the Brussels sprouts.\n3. Pull off any yellow outer leaves.\n4. Mix them in a bowl with the olive oil, salt and pepper.\n5. Pour them on a sheet pan and roast for 35 to 40 minutes.\n6. They should be until crisp on the outside and tender on the inside.\n7. Shake the pan from time to time to brown the sprouts evenly.\n8. Sprinkle with more kosher salt ( I like these salty like French fries).\n9. Serve and enjoy!\n"
      expect(recipe.summary).to eq (recipe_string)
      end
    end
  end

  describe '#contains_allergens' do
    context 'when recipe is chocolate quinoa (lol)' do
      it 'returns false because the recipe doesn\'t contain allergens' do
        safe_name = "Chocolate Quinoa"
        safe_ingredients = [
          Ingredient.new(1.0, "cup", "Quinoa"),
          Ingredient.new(1.0, "cup", "Chocolate")
        ]
        safe_instructions = [
          "Melt chocolate.",
          "Pour over quinoa.",
          "Regret your life."
        ]
        safe_recipe = Recipe.new(safe_name, safe_instructions, safe_ingredients)
        expect(safe_recipe.contains_allergens?).to eq(false)
      end
    end

    context 'when recipe is brussel sprouts' do
      it 'returns true because the recipe has allergens' do
      name = "Roasted Brussels Sprouts"
      ingredients = [
          Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
          Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
          Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
          Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
        ]
      instructions = [
          "Preheat oven to 400 degrees F.",
          "Cut off the brown ends of the Brussels sprouts.",
          "Pull off any yellow outer leaves.",
          "Mix them in a bowl with the olive oil, salt and pepper.",
          "Pour them on a sheet pan and roast for 35 to 40 minutes.",
          "They should be until crisp on the outside and tender on the inside.",
          "Shake the pan from time to time to brown the sprouts evenly.",
          "Sprinkle with more kosher salt ( I like these salty like French fries).",
          "Serve and enjoy!"
        ]
      recipe = Recipe.new(name, instructions, ingredients)
      expect(recipe.contains_allergens?).to eq(true)
      end
    end
  end
end

describe Ingredient do
  describe '#parse' do
    it 'adds a new ingredient from a string' do
      a_recipe = "5.0 lb(s) Cured Ham"
      expect(Ingredient.parse(a_recipe).name).to eq("Cured Ham")
    end
  end
end
