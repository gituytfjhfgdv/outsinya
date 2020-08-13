class Users::PositiveWordsController < UsersController

  def new
    @positive_word = PositiveWord.new
  end

  def create
    @positive_word = PositiveWord.new(positive_word_params)
    @positive_word.user = @current_user
    if @positive_word.save
      redirect_to users_positive_words_path
    else
      render :new
    end
  end

  def index
    @positive_words = current_user.positive_words
  end

  def destroy
    positive_word = PositiveWord.find_by(id: params[:id])
    positive_word.destroy!
    redirect_to users_positive_words_path
  end

  private

  def positive_word_params
    params.require(:positive_word).permit(:content)
  end
end
