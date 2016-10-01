class AddMemberToProject < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :member, foreign_key: true
  end
end
