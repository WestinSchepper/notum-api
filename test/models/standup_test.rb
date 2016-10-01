# == Schema Information
#
# Table name: standups
#
#  id          :integer          not null, primary key
#  did         :text
#  doing       :text
#  impediments :text
#  project_id  :integer
#  member_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class StandupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
