class Users::PersonalWordsController < UsersController
  permits :content, :type

  def create(personal_word)
    p 'create!'
    p personal_word
    @words = current_user.personal_words
    word_class = personal_word['type'].camelize.constantize
    @personal_word = word_class.new(content: personal_word['content'], user_id: current_user.id)
    if @personal_word.save
      redirect_to users_personal_words_path
    else
      render :index
    end
  end

  def index
    @words = current_user.personal_words
    @personal_word = PersonalWord.new
  end

  def destroy(id)
    personal_word = PersonalWord.find_by(id: id)
    personal_word.destroy!
    redirect_to users_personal_words_path
  end
end
