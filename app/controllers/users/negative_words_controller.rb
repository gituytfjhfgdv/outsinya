class Users::NegativeWordsController < Users::PersonalWordsController
  private

  def set_word_type
    @word_type = 'negative_word'
  end
end
