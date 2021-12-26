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
      redirect_to users_path, success: '更新できました!'
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end

  private

  def user_paramas
    params.require(:user).permit(:email, :name, :image)
  end

end
