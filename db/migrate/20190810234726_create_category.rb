class CreateCategory < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_categories do |t|
      t.string :name
    end
  end
end
