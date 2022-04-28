class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :review

  #バリデーション
  validates :comment, length: { in: 1..500 } #1~500文字

end
