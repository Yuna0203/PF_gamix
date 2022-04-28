class Review < ApplicationRecord

  belongs_to :customer
  belongs_to :game
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #バリデーション
  validates :evaluation, presence: true #入力必須
  validates :review_title, length: { in: 1..50 } #1~50文字
  validates :review, presence: true #入力必須

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

end
