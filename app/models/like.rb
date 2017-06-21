class Like < ApplicationRecord
  belongs_to :corsogroup
  belongs_to :wagon
  
  validates_uniqueness_of :corsogroup, scope: :wagon
end