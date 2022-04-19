class Game < ApplicationRecord

  belongs_to :platform
  belongs_to :genre
  belongs_to :target_age
  has_many :reviews, dependent: :destroy

  #ゲーム画像のカラム
  has_one_attached :game_image

  #ゲーム画像がない時の代わりの画像指定
  def get_game_image
    unless game_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      game_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    game_image
  end

end
