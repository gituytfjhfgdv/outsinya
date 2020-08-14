# == Schema Information
#
# Table name: personal_words
#
#  id         :uuid             not null, primary key
#  content    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid
#
# Indexes
#
#  index_personal_words_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class PersonalWordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
