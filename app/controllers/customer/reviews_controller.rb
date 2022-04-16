class Customer::ReviewsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def create
    game = Game.find(params[:game_id])
    review = current_customer.reviews.new(review_params)
    review.game_id = game.id
    review.save
    redirect_to customer_game_review_path(game.id, review.id)
  end

  def show
  end

  def edit
  end

  private

  def review_params
    params.require(:review).permit(:evaluation, :review_title, :review)
  end
end
