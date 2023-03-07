class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :address, :photo)
  end
end
