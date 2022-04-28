class Customer::ReviewsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def create
    game = Game.find(params[:game_id])
    review = current_customer.reviews.new(review_params)
    review.game_id = game.id
    if review.save
      redirect_to customer_game_review_path(game.id, review.id)
    else
      @game = Game.find(params[:game_id])
      @review = Review.new
      render 'new'
    end
  end

  def show
    @review = Review.find(params[:id])
    @game = Game.find(params[:game_id])
  end

  def edit
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])
    if @review.customer == current_customer
      render "edit"
    else
      redirect_to customer_games_path
    end
  end

  def update
    review = Review.find(params[:id])
    game = Game.find(params[:game_id])
    if review.update(review_params)
      redirect_to customer_game_review_path(game.id, review)
    else
      @game = Game.find(params[:game_id])
      @review = Review.find(params[:id])
      render :edit
    end
  end

  def destroy
    game = Game.find(params[:game_id])
    Review.find_by(id: params[:id], game_id: params[:game_id]).destroy
    redirect_to customer_game_path(game.id)
  end

  private

  def review_params
    params.require(:review).permit(:evaluation, :review_title, :review)
  end
end
