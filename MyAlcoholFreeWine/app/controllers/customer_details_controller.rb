class CustomerDetailsController < ApplicationController
  skip_before_action :authorize
  before_action :set_customer_detail, only: [:show, :edit, :update, :destroy]

  # GET /customer_details
  # GET /customer_details.json
  def index
    @customer_details = CustomerDetail.order(:email)
  end

  # GET /customer_details/1
  # GET /customer_details/1.json
  def show
  end

  # GET /customer_details/new
  def new
    @customer_detail = CustomerDetail.new
  end

  # GET /customer_details/1/edit
  def edit
  end

  # POST /customer_details
  # POST /customer_details.json
  def create
    @customer_detail = CustomerDetail.new(customer_detail_params)
    # When we make a new CustomerDetail, also make a Customer to go with it, using the Email from CustomerDetail
    customer_info = customer_detail_params['customer_attributes']
    customer_info['email'] = customer_detail_params['email']
    @customer = Customer.create(customer_info)
    @customer_detail.customer = @customer

    respond_to do |format|
      if @customer_detail.save
        format.html { redirect_to wines_url,
                                  notice: "User #{@customer_detail.email} was successfully created. Please proceed to Login." }
        format.json { render :show, status: :created, location: @customer_detail }
      else
        format.html { render :new }
        format.json { render json: @customer_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_details/1
  # DELETE /customer_details/1.json
  def destroy
    @customer_detail.destroy
    respond_to do |format|
      format.html { redirect_to customer_details_url, notice: 'Customer detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_detail
      @customer_detail = CustomerDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_detail_params
      params.require(:customer_detail).permit(:email, :password, :password_confirmation, customer_attributes: [:name, :address])
    end
end
