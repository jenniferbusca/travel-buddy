class DeleteUsernameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :username
    rename_column :users, :email_address, :email
  end
end
