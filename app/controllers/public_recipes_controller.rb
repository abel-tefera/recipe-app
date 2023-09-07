class PublicRecipesController < ApplicationController
  def index
    @recipe_all = Recipe.where(public: true).includes(:user).order(created_at: :desc)
  end
end
