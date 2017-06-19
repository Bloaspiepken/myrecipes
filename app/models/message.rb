class Message < ApplicationRecord
  belongs_to :corsogroup
  validates :content, presence: true
  validates :corsogroup_id, presence: true
  
  def self.most_recent
    order(:created_at).last(50)
  end
end