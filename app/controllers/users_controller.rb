class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ご登録ありがとうございます！登録が完了致しました。"
      redirect_to @user
    else
      flash.now[:danger] = "登録に失敗しました。入力内容に誤りがないかご確認下さい。"
      render :new
    end
  end
  
  private
  # ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :staff)
  end
end