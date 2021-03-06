# == Schema Information
#
# Table name: daily_user_word_records
#
#  id                   :uuid             not null, primary key
#  all_daily_word_count :integer
#  count                :integer          not null
#  created_on           :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  personal_word_id     :uuid             not null
#  user_id              :uuid             not null
#
# Indexes
#
#  index_daily_user_word_records_on_personal_word_id  (personal_word_id)
#  index_daily_user_word_records_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (personal_word_id => personal_words.id)
#  fk_rails_...  (user_id => users.id)
#
class DailyUserWordRecord < ApplicationRecord
  belongs_to :user
  belongs_to :personal_word
end
