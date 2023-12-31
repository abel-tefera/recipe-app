class AddPropertiesToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :name, :string
    add_column :recipes, :preparation_time, :string
    add_column :recipes, :cooking_time, :string
    add_column :recipes, :description, :string
    add_column :recipes, :public, :boolean, :default => false
  end
end
