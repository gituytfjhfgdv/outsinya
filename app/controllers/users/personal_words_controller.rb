class Users::PersonalWordsController < UsersController
  def new
    @negative_word = PersonalWord.new
  end

  def create
    @negative_word = NegativeWord.new(negative_word_params)
    @negative_word.user = @current_user
    if @negative_word.save
      redirect_to users_negative_words_path
    else
      render :new
    end
  end

  def index
    @negative_words = current_user.negative_words
  end

  def destroy
    negative_word = NegativeWord.find_by(id: params[:id])
    negative_word.destroy!
    redirect_to users_negative_words_path
  end

  private

  def negative_word_params
    params.require(:negative_word).permit(:content)
  end
end
