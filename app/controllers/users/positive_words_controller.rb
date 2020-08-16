class Users::PositiveWordsController < Users::PersonalWordsController
  private

  def set_word_type
    @word_type = 'positive_word'
  end
end
