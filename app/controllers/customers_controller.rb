class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    @search = CustomerSearch.new(params[:search])
    @customers = @search.scope
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    if current_user.user_admin == true
      @customer = Customer.new
    else
      redirect_to root_path, notice: "You are not authorized to view this page"
    end
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import
    if current_user.user_admin == true 
      Customer.import(params[:file])
      redirect_to customers_path, notice: "Customers Updated Successfully"
    else
      redirect_to root_path, notice: "You are not authorized to view this page"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_customer
      if current_user.user_admin == true
        @customer = Customer.find_by_id(params[:id])
      else
        redirect_to root_path, notice: "You are not authorized to view this page"
      end
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:order_no, :date, :contact_email, :recipient_name, :recipient_phone, :delivery_country, :delivery_state, :delivery_city, :delivery_address, :postal_code, :uniq_id)
      .with_defaults(uniq_id: SecureRandom.hex(10).upcase)
    end
end
