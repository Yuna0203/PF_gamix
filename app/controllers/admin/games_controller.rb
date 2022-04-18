class Admin::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page])
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.new(game_params)
    game.save
    redirect_to admin_game_path(game)
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    game = Game.find(params[:id])
    game.update(game_params)
    redirect_to admin_games_path
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to admin_games_path
  end

  private

  def game_params
    params.require(:game).permit(:game_name, :game_introduction, :price, :game_image, :genre_id, :platform_id, :target_age_id)
  end
end
