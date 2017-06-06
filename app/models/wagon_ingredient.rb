class WagonIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :wagon
end