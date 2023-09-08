require 'rails_helper'
require 'capybara/rspec'


RSpec.describe 'Recipe #show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'syed', email: 'test@gmail.com', password: 'testest')
    @food = Food.create(name: 'Apple', measurement_unit: 'kg', price: 100, quantity: 2, user_id: @user.id)
    @recipe = Recipe.create(name: 'My unknown recipe', description: 'this is my unknwon recipe', preparation_time: '10',
                            cooking_time: '10', user: User.first)
    @recipe_food1 = RecipeFood.create(quantity: 2, recipe_id: @recipe.id, food_id: @food.id)
    @recipe_food2 = RecipeFood.create(quantity: 2, recipe_id: @recipe.id, food_id: @food.id)

    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'

    visit recipe_path(@recipe)
  end

  it 'I can see a recipe name' do
    expect(page).to have_content(@recipe.name)
  end

  it 'I can see the recipe description' do
    expect(page).to have_content(@recipe.description)
  end

  it 'I can see the recipe preparation time' do
    expect(page).to have_content(@recipe.preparation_time)
  end

  it 'I can see the recipe cooking time' do
    expect(page).to have_content(@recipe.cooking_time)
  end


  it 'I can see a Generate shopping list button' do
    expect(page).to have_content('Generate shopping list')
  end

  it 'I can see a Add ingredients button' do
    expect(page).to have_content('Add ingredients')
  end

  it 'I can see all the elements in ingredients table' do
    @recipe.recipe_foods.each do |recipe_food|
      expect(page).to have_content(recipe_food.food.name)
      expect(page).to have_content(recipe_food.food.quantity)
    end
  end

  it 'I can see a Remove button' do
    expect(page).to have_content('Remove')
  end
end
