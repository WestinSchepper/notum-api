class CreateJoinTableProjectMember < ActiveRecord::Migration[5.0]
  def change
    create_join_table :projects, :members do |t|
      # t.index [:project_id, :member_id]
      # t.index [:member_id, :project_id]
    end
  end
end
