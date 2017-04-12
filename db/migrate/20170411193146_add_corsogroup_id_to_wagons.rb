class AddCorsogroupIdToWagons < ActiveRecord::Migration[5.0]
  def change
    add_column :wagons, :corsogroup_id, :integer
  end
end
