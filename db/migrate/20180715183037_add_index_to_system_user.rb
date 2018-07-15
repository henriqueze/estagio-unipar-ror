class AddIndexToSystemUser < ActiveRecord::Migration[5.2]
  def change
  	add_index :system_users, :username, unique: true
  end
end
