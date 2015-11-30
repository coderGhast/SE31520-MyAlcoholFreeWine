class WinesController < ApplicationController
  before_action :set_current_page, except: [:index]
  before_action :set_wine, only: [:show]

  def set_current_page
    @current_page = params[:page]
  end

  # GET /wines
  # GET /wines.json
  def index
    WebServiceCaller.new.get_web_service_wines

    # Paginate the Wine results, in alphabetical order, not caring about capitalization.
    @wines = Wine.paginate(page: params[:page],
                           per_page: params[:per_page])
                 .order('LOWER(name)')
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
