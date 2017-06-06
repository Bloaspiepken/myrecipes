class Comment < ApplicationRecord
  validates :description, presence: true, length:{ minimum: 4, maximum: 140 }
  belongs_to :corsogroup
  belongs_to :wagon
  validates :corsogroup_id, presence: true
  validates :wagon_id, presence: true
  default_scope -> { order(updated_at: :desc) }
end