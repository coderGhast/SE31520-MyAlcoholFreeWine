class WinesController < ApplicationController
  before_action :set_wine, only: [:show]

  # GET /wines
  # GET /wines.json
  def index
    # Compare known Wines to WebService results
    # Update any Wines that are found to be cheaper
    # Remove any Wines that can't be found at all
    # Display all Wines
    ## NOTE: Later, Wine update from WebService should be a bit more efficient

    WebServiceCaller.new.get_web_service_wines
    @wines = Wine.all
  end

  # GET /wines/1
  # GET /wines/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def wine_params
    params.require(:wine).permit( :name, :description, :image_url, :price, :country_of_origin, :grape_type, :suitable_for_vegetarians, :bottle_size, :supplier)
  end
end
