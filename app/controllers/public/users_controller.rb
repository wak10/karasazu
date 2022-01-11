class Public::UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_paramas)
    else
      render :edit
    end
  end

  private

  def user_paramas
    params.require(:user).permit(:email, :name, :image)
  end

end
