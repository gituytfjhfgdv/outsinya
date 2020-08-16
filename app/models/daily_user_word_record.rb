class DailyUserWordRecord < ApplicationRecord
  belongs_to :user
  belongs_to :personal_word
end
