class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  #validates :title, presence: true
  #validates :year, presence: true
  #validates :month, presence: true
  #validates :date, presence: true
  #validates :theater, presence: true
end
