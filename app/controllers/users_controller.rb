class UsersController < ApplicationController
  before_action :ensure_login

  private

  def ensure_login
    redirect_to root_path unless current_user
  end
end
