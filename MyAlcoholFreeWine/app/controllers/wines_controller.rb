class WinesController < ApplicationController
  before_action :set_current_page
  before_action :set_last_search
  before_action :set_wine, only: [:show]

  @query = ''
  # GET /wines
  # GET /wines.json
  def index
    # get the current list of wines and update our records
    # WebServiceCaller.new.update_web_service_wines
    # Paginate the Wine results, in alphabetical order, not caring about capitalization.
    @wines = Wine.paginate(page: params[:page],
                           per_page: params[:per_page])
                 .order('LOWER(name)')



  end

  def search
    search = Wine.search do
      fulltext params[:search]
      paginate :page => params[:page], :per_page => params[:per_page]
    end

    @wines = search.results

    render 'index'
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

  private
  def set_last_search
    @last_search = params[:search] || ''
  end

  private
  def set_current_page
    @current_page = params[:page] || 1
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def wine_params
    params.require(:wine).permit( :name, :description, :image_url, :price, :country_of_origin, :grape_type, :suitable_for_vegetarians, :bottle_size, :supplier)
  end
end
