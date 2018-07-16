class AddUsernameToSystemUser < ActiveRecord::Migration[5.2]
  def change
    add_column :system_users, :username, :string , null: false
  end
end
