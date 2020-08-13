# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  icon_image :string
#  nickname   :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
end
