class UsersController < ApplicationController
  before_action :ensure_login
  permits :id
  def destroy(id)
    return unless current_user.id == id
    if current_user.destroy
      flash.now[:info] = 'アカウントの削除が完了しました。ご利用ありがとうございました。'
    end
    redirect_to root_path
  end

  private

  def ensure_login
    redirect_to root_path unless current_user
  end
end
