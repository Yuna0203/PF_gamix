class Customer::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_customer_path(current_customer)
  end

  def quit
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :self_introduction, :profile_image, :gender, :age, :game_style)
  end


end
