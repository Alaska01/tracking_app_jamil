class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.integer :order_no
      t.date :date
      t.string :contact_email
      t.string :recipient_name
      t.string :recipient_phone
      t.string :delivery_country
      t.string :delivery_state
      t.string :delivery_city
      t.string :delivery_address
      t.string :postal_code
      t.string :uniq_id

      t.timestamps
    end
  end
end
