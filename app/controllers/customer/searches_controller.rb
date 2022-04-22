class Customer::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @games = Game.looks(params[:search], params[:word])
    @word = params[:word]
  end
end
