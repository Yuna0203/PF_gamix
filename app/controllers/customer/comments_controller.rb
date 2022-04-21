class Customer::CommentsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end

  def create
    game = Game.find(params[:game_id])
    review = Review.find(params[:review_id])
    comment = current_customer.comments.new(comment_params)
    comment.game_id = game.id
    comment.review_id = review.id
    comment.save
    redirect_to customer_game_review_path(game, review)
  end

  def destroy
    game = Game.find(params[:game_id])
    review = Review.find(params[:review_id])
    Comment.find_by(id: params[:id], game_id: params[:game_id], review_id: params[:review_id]).destroy
    redirect_to customer_game_review_path(game.id, review.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
