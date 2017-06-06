class Ingredient < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name
    has_many :wagon_ingredients
    has_many :wagons, through: :wagon_ingredients
end