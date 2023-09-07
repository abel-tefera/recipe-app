class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  load_and_authorize_resource

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.where(user: current_user)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @foods = Food.joins(:recipe_foods).where(recipe_foods: { recipe_id: @recipe.id }).includes([:recipe_foods])
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to action: 'index', notice: 'Recipe was successfully created.' }
        format.json { render :index, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toogle
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.public = !@recipe.public
    if @recipe.save
      redirect_to(request.referrer || root_path)
    else
      flash[:error] = 'Error updating recipe'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time)
  end
end
