class CreateCorsogroups < ActiveRecord::Migration[5.0]
  def change
    create_table :corsogroups do |t|
    t.string :corsoname
    t.string :email
    t.timestamps
    end
  end
end
