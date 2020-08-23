class Users::HomesController < UsersController
  def index
    @current_user = current_user
    @yesterday_word_records = @current_user.daily_user_word_records.where(created_on: 1.day.ago.all_day)
    @positive_words = @current_user.positive_words.limit(5)
    @negative_words = @current_user.negative_words.limit(5)
  end
end
