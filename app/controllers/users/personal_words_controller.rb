class Users::PersonalWordsController < UsersController
  before_action :set_word_type

  def new
    model_name = @word_type.split("_").map{|w| w[0] = w[0].upcase; w}.join
    personal_word = model_name.constantize
    @personal_word = personal_word.new
  end

  def create
    model_name = @word_type.split("_").map{|w| w[0] = w[0].upcase; w}.join
    personal_word = model_name.constantize
    @personal_word = personal_word.new(personal_word_params)
    @personal_word.user = @current_user
    if @personal_word.save
      redirect_to users_personal_words_path
    else
      render :new
    end
  end

  def index
    p @word_type
    p current_user.send("#{@word_type}s".to_sym)
    @words = current_user.send("#{@word_type}s".to_sym)
  end

  def destroy
    personal_word = PersonalWord.find_by(id: params[:id])
    personal_word.destroy!
    redirect_to users_personal_words_path
  end

  private

  def personal_word_params
    params.require(@word_type).permit(:content)
  end

  def set_word_type
    @word_type = 'personal_word'
  end
end
