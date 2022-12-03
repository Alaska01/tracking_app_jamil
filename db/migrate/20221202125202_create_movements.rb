class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.string :detail
      t.datetime :tracking_time
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
