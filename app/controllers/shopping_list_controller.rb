class ShoppingListController < ApplicationController
  def index
    all_public_recipe_foods = Recipe.where(public: true).includes(recipe_foods: [:food]).map(&:recipe_foods)
      .flatten.map(&:food)
    all_user_foods = Food.where(user: current_user)

    @missing_foods = all_public_recipe_foods.reject { |food| all_user_foods.include?(food) }
    @amt = @missing_foods.length
    @total = @missing_foods.map do |food|
      food.price * food.recipe_foods.select do |recipe|
                     recipe.food_id == food.id
                   end.first.quantity
    end.sum
  end
end
