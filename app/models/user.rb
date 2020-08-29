# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  icon_image :string
#  nickname   :string           not null
#  uid        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :personal_words, dependent: :destroy
  has_many :positive_words, dependent: :destroy
  has_many :negative_words, dependent: :destroy
  has_many :daily_user_word_records, dependent: :destroy
end
