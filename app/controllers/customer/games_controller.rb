class Customer::GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    game = Game.new(game_params)
    game.save
    redirect_to customer_game_path(game.id)
  end

  def index
  end

  def show
  end

  private
  def game_params
    params.require(:game).permit(:game_name, :game_introduction, :price, :game_image)
  end


end
