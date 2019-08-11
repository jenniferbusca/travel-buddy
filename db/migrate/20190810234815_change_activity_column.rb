class ChangeActivityColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :category
    add_column :activities, :category_id, :integer
  end
end
