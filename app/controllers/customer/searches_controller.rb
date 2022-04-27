class Customer::SearchesController < ApplicationController

  def search
    @games = Game.looks(params[:search], params[:word])
    @word = params[:word]
  end
end
