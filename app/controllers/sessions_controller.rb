class SessionsController < ApplicationController
  def create
    user_data = request.env['omniauth.auth']
    unless user_data
      flash[:alert] = 'twitterでのログインに失敗しました。'
      redirect_to root_url
    end

    user = User.find_by(uid: user_data[:uid])
    if user
      flash[:success] = "#{user.nickname}様ようこそ！"
      log_in(user) && redirect_to(root_url)
      return
    end

    new_user = User.new(
      uid: user_data[:uid],
      nickname: user_data[:info][:nickname]
    )
    if new_user.save
      log_in new_user
      flash[:success] = 'ユーザ登録しました'
    else
      flash[:alert] = 'ユーザ登録に失敗しました'
    end
    redirect_to root_url
  end

  def destroy
    if signed_in?
      log_out
      flash[:success] = 'ログアウトしました'
    end
    redirect_to root_url
  end
end
