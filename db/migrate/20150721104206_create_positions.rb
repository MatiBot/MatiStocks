class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :symbol
      t.float :price
      t.integer :number

      t.timestamps null: false
    end
  end
end
