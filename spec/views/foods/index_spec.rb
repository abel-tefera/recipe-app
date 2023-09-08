require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Food #index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'syed', email: 'test@gmail.com', password: 'testest')
    @food1 = Food.create(name: 'Apple', measurement_unit: 'kg', price: 100, quantity: 2, user_id: @user.id)
    @food2 = Food.create(name: 'Apple', measurement_unit: 'kg', price: 100, quantity: 2, user_id: @user.id)

    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
    visit foods_path
  end

  it 'I can see add food button' do
    expect(page).to have_content('Add Food')
  end

  it 'When I click to Add Food button, it redirects me Add Food Page.' do
    click_on 'Add Food'
    expect(page).to have_current_path(new_food_path)
  end

  it 'I can see all the foods info' do
    @user.foods.each do |food|
      expect(page).to have_content(food.name)
      expect(page).to have_content(food.measurement_unit)
      expect(page).to have_content(food.price)
    end
  end

  it 'I can see a delete button' do
    expect(page).to have_content('Delete Food')
  end
end
