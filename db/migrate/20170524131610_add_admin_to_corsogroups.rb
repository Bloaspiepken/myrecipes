class AddAdminToCorsogroups < ActiveRecord::Migration[5.0]
  def change
    add_column :corsogroups, :admin, :boolean, default: false
  end
end
