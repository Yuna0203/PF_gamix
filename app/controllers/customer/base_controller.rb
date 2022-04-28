class Customer::BaseController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def after_sign_in_path_for(resource)
    edit_customer_customer_path(current_customer)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end