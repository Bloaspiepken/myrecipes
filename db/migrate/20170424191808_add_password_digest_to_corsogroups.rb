class AddPasswordDigestToCorsogroups < ActiveRecord::Migration[5.0]
  def change
    add_column :corsogroups, :password_digest, :string
  end
end
