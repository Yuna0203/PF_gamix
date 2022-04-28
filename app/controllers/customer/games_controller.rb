class Customer::GamesController < ApplicationController
  before_action :set_game, only: [:show]
  before_action :set_reviews, only: [:show]

  def new
    @game = Game.new
  end

  def create
    game = Game.new(game_params)
    if game.save
      redirect_to customer_game_path(game.id)
    else
      @game = Game.new
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
    @review = Review.new
    @reviews_latest3 = @game_reviews.first(3) #新着レビューを上から3件取得
    @reviews_offset3 = @game_reviews.offset(3) #新着レビュー3件を除く全レビューを取得
  end

  def index
    @games = Game.page(params[:page])
  end

  private

  def game_params
    params.require(:game).permit(:game_name, :game_introduction, :price, :game_image, :genre_id, :platform_id, :target_age_id)
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def set_reviews
    @game_reviews = @game.reviews.includes(:customer).order('created_at DESC') #gameに紐づくreviewsを新着順で取得
  end

end
