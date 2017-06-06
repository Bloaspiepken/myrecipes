class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :corsogroup_id
      t.integer :wagon_id
      t.timestamps
    end
  end
end
