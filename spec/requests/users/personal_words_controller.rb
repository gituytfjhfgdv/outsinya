RSpec.describe "Users::PersonalWords", type: :request do
  let(:user) { create(:user) }
  before do
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
  end

  describe "get my_biddings_path" do
    context "" do
      it "" do
      end
    end
  end
end
