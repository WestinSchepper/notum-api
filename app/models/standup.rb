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

class Standup < ApplicationRecord
  belongs_to :project
  belongs_to :member

  def to_json(options={})
     options[:except] ||= [:project_id, :member_id]
     super(options)
   end
end
