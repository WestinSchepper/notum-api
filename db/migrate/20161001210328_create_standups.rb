class CreateStandups < ActiveRecord::Migration[5.0]
  def change
    create_table :standups do |t|
      t.text :did
      t.text :doing
      t.text :impediments
      t.references :project, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
