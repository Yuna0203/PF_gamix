class Customer::CustomersController < ApplicationController
  before_action :ensure_current_customer, {only: [:edit, :update]}


  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_customer_path(current_customer)
    else
      @customer = Customer.find(params[:id])
      render :edit
    end
  end

  def quit
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております"
    redirect_to new_customer_session_path
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :self_introduction, :profile_image, :gender, :age, :game_style, :is_deleted)
  end

end
