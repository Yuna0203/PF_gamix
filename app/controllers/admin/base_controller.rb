class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def after_sign_in_path_for(resource)
    admin_games_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

end