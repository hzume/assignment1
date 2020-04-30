class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  validates :title, presence: true, length: { maximum: 50}
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 1000, less_than: 3000}
  validates :month, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 13}
  validates :date, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 32}
  validates :theater, presence: true, length: { maximum: 50}
  
  def Micropost.search(search)
    if search
      where(['content LIKE ? or title LIKE ?', "%#{search}%", "%#{search}%"])
    else
      all
    end
  end
end
