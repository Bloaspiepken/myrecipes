class Wagon < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  belongs_to :corsogroup
  validates :corsogroup_id, presence: true
end