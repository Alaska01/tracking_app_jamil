require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  test "should create customer" do
    visit customers_url
    click_on "New customer"

    fill_in "Contact email", with: @customer.contact_email
    fill_in "Date", with: @customer.date
    fill_in "Delivery address", with: @customer.delivery_address
    fill_in "Delivery city", with: @customer.delivery_city
    fill_in "Delivery country", with: @customer.delivery_country
    fill_in "Delivery state", with: @customer.delivery_state
    fill_in "Order no", with: @customer.order_no
    fill_in "Postal code", with: @customer.postal_code
    fill_in "Recipient name", with: @customer.recipient_name
    fill_in "Recipient phone", with: @customer.recipient_phone
    fill_in "Uniq", with: @customer.uniq_id
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "should update Customer" do
    visit customer_url(@customer)
    click_on "Edit this customer", match: :first

    fill_in "Contact email", with: @customer.contact_email
    fill_in "Date", with: @customer.date
    fill_in "Delivery address", with: @customer.delivery_address
    fill_in "Delivery city", with: @customer.delivery_city
    fill_in "Delivery country", with: @customer.delivery_country
    fill_in "Delivery state", with: @customer.delivery_state
    fill_in "Order no", with: @customer.order_no
    fill_in "Postal code", with: @customer.postal_code
    fill_in "Recipient name", with: @customer.recipient_name
    fill_in "Recipient phone", with: @customer.recipient_phone
    fill_in "Uniq", with: @customer.uniq_id
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "should destroy Customer" do
    visit customer_url(@customer)
    click_on "Destroy this customer", match: :first

    assert_text "Customer was successfully destroyed"
  end
end
