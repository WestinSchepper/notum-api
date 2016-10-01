# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Member < ApplicationRecord
  has_and_belongs_to_many :projects
end
