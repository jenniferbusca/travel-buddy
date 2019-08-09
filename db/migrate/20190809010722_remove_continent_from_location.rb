class RemoveContinentFromLocation < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :continent
  end
end
