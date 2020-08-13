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
end
