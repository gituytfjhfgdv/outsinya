# == Schema Information
#
# Table name: daily_last_tweet_id_for_users
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tweet_id   :integer
#  user_id    :uuid             not null
#
# Indexes
#
#  index_daily_last_tweet_id_for_users_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class DailyLastTweetIdForUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
