class AddImageToWagons < ActiveRecord::Migration[5.0]
  def change
    add_column :wagons, :image, :string 
  end
end
