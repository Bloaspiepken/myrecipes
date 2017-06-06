class CreateWagonIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :wagon_ingredients do |t|
      t.integer :wagon_id
      t.integer :ingredient_id
    end
  end
end
