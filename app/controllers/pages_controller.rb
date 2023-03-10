class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
  end

  def profile
    @user = current_user
    @services = Service.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update!(user_params)
      redirect_to profile_path(@user)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path

  end

  def payment_page
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :address, :photo)
  end
end
