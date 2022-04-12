class Admin::PlatformsController < ApplicationController
  def index
    @platform = Platform.new
    @platforms = Platform.all
  end

  def create
    @platform = Platform.new(platform_params)
    @platform.save
    redirect_to admin_platforms_path
  end

  def edit
    @platform = Platform.find(params[:id])
  end

  def update
    @platform = Platform.find(params[:id])
    @platform.update(platform_params)
    redirect_to admin_platforms_path
  end

  def destroy
    @platform = Platform.find(params[:id])
    @platform.destroy
    redirect_to admin_platforms_path
  end

  private
  def platform_params
    params.require(:platform).permit(:platform_name) #ここエラー出るから質問する
  end
end
