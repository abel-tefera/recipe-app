class PublicRecipesController < ApplicationController
  def index
    @recipe_all = Recipe.where(public: true).includes(:user)
  end
end
