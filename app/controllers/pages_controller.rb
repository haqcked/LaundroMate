class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :set_user, only: [:home, :profile, :edit, :update, :destroy]

  def home
  end

  def index
    @reviews = Review.highest_rated
  end

  def profile
    @services = Service.all
  end

  def edit
  end

  def update
    if @user.update!(user_params)
      redirect_to profile_path(@user)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path

  end

  def payment_page
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :address, :photo)
  end
end
