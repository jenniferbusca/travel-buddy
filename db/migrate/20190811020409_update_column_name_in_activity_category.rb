class UpdateColumnNameInActivityCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :activities, :category_id, :activity_category_id
  end
end
