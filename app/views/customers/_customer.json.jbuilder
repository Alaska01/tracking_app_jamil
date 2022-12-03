json.extract! customer, :id, :order_no, :date, :contact_email, :recipient_name, :recipient_phone, :delivery_country, :delivery_state, :delivery_city, :delivery_address, :postal_code, :uniq_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
