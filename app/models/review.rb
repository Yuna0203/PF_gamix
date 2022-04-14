class Review < ApplicationRecord

  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

end
