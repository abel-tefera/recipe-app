class RecipeFoodsController < ApplicationController
  def new
    @recipe_foods = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_parms)
    @recipe_food.recipe_id = params[:recipe_id]

    @existing_recipe_food = RecipeFood.where(recipe_id: params[:recipe_id], food_id: @recipe_food.food_id)

    if @existing_recipe_food.exists?
      @existing_recipe_food.first.quantity = @recipe_food.quantity
      if @existing_recipe_food.first.save
        flash[:notice] = 'Ingredient has been added'
        redirect_to "/recipes/#{params[:recipe_id]}"
      else
        flash[:error] = 'An error has occured'
        render :new, status: 422
      end
    elsif @recipe_food.save
      flash[:notice] = 'Ingredient has been added'
      redirect_to "/recipes/#{params[:recipe_id]}"
    else
      flash[:error] = 'An error has occured'
      render :new, status: 422
    end
  end

  def destroy
    @recipe = RecipeFood.find_by(food_id: params[:id], recipe_id: params[:recipe_id])
    if @recipe.destroy
      flash[:notice] = 'Ingredient has been removed'
      redirect_to(request.referrer || root_path)
    else
      flash[:error] = 'An error has occured'
    end
  end

  private

  def recipe_food_parms
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
