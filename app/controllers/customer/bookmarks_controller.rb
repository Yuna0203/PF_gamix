class Customer::BookmarksController < ApplicationController
  before_action :authenticate_customer!

  def index
  end

  def create
    @game = Game.find(params[:game_id])
    bookmark = @game.bookmarks.new(customer_id: current_customer.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    bookmark = @game.bookmarks.find_by(customer_id: current_customer.id)
    if bookmark.present?
      bookmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
end
