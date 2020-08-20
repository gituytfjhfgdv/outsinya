class Users::DailyUserWordRecordsController < UsersController
  def index
    @current_user = current_user
    @daily_records = @current_user.daily_user_word_records
  end
end
