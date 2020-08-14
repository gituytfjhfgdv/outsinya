class Users::HomesController < UsersController
  def index
    @current_user = current_user
  end
end
