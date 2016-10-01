class RemoveMemberFromProject < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :member_id, :integer
  end
end
