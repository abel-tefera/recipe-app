class ShoppingListController < ApplicationController
  def index
    all_public_recipe_foods = Recipe.where(public: true).includes(recipe_foods: [:food]).map(&:recipe_foods)
      .flatten.map(&:food)
    all_user_foods = Food.where(user: current_user)

    @missing_foods = all_public_recipe_foods.reject { |food| all_user_foods.include?(food) }
  end
end
