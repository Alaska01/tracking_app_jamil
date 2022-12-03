class Customers::MovementsController < ApplicationController
  before_action :set_customer
  before_action :set_movement, only: %i[ show edit update destroy ]

  # GET /movements or /movements.json
  def index
    @movements = @customer.movements
  end

  # GET /movements/1 or /movements/1.json
  def show
  end

  # GET /movements/new
  def new
    # @movement = Movement.new
    @movement = @customer.movements.build
    # @movement = @customer.movements.build(movement_params)
  end

  # GET /movements/1/edit
  def edit
  end

  # POST /movements or /movements.json
  def create
    @movement = Movement.new(movement_params)

    respond_to do |format|
      if @movement.save
        format.html { redirect_to customer_movements_url, notice: "Movement was successfully created." }
        format.json { render :show, status: :created, location: @movement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movements/1 or /movements/1.json
  def update
    respond_to do |format|
      if @movement.update(movement_params)
        format.html { redirect_to movement_url(@movement), notice: "Movement was successfully updated." }
        format.json { render :show, status: :ok, location: @movement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movements/1 or /movements/1.json
  def destroy
    @movement.destroy

    respond_to do |format|
      format.html { redirect_to movements_url, notice: "Movement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:customer_id])
    end

    def set_movement
      # @customer = Customer.find(params[:customer_id])
      @movement = Movement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movement_params
      params.require(:movement).permit(:detail, :tracking_time, :customer_id)
    end
end
