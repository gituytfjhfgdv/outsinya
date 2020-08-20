class Users::HomesController < UsersController
  def index
    @current_user = current_user
    @yesterday_word_records = @current_user.daily_user_word_records.where(created_on: 1.day.ago.all_day)
  end
end
