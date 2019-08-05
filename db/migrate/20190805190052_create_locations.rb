class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :country
      t.string :continent

      t.timestamps
    end
  end
end
