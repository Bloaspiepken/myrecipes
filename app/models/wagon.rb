class Wagon < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  belongs_to :corsogroup
  validates :corsogroup_id, presence: true
  default_scope -> { order(updated_at: :desc)}
  has_many :wagon_ingredients
  has_many :ingredients, through: :wagon_ingredients
  has_many :comments, dependent: :destroy
end