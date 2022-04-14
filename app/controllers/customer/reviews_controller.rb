class Customer::ReviewsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def create
    game = Game.find(params[:game_id])
    review = current_user.reviews.new(game_params)
    review.game_id = game.id
    redirect_to customer_game_review_path(game)
  end

  def show
  end

  def edit
  end

  private

  def game_params
    params.require(:review).permit(:evaluation, :review_title, :review)
  end
end
