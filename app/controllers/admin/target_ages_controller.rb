class Admin::TargetAgesController < ApplicationController
  def index
    @target_age = TargetAge.new
    @target_ages = TargetAge.all
  end

  def create
    @target_age = TargetAge.new(target_age_params)
    @target_age.save
    redirect_to admin_target_ages_path
  end

  def edit
    @target_age = TargetAge.find(params[:id])
  end

  def update
    @target_age = TargetAge.find(params[:id])
    @target_age.update(target_age_params)
    redirect_to admin_target_ages_path
  end

  def destroy
    @target_age = TargetAge.find(params[:id])
    @target_age.destroy
    redirect_to admin_target_ages_path
  end

  private

  def target_age_params
    params.require(:target_age).permit(:target_age)
  end
end
