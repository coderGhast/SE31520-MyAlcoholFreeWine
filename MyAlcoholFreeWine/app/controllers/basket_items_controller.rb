# Code based/modified from Agile Web Development with Rails Book by Andreas Schwarz, Dave Thomas,
# David Heinemeier Hansson, James Duncan Davidson, Justin Gehtland, Leon Breedt, and Mike Clark
class BasketItemsController < ApplicationController
  include CurrentBasket
  skip_before_action :authorize
  before_action :set_basket, only: [:create]
  before_action :set_basket_item, only: [:show, :edit, :update, :destroy]


  # GET /basket_items
  # GET /basket_items.json
  def index
    @basket_items = BasketItem.all
  end

  # GET /basket_items/1
  # GET /basket_items/1.json
  def show
  end

  # GET /basket_items/new
  def new
    @basket_item = BasketItem.new
  end

  # GET /basket_items/1/edit
  def edit
  end

  # POST /basket_items
  # POST /basket_items.json
  def create
    wine = Wine.find(params[:wine_id])
    @basket_item = @basket.add_wine(wine.id)

    respond_to do |format|
      if @basket_item.save
        format.html { redirect_to @basket_item.basket }
        format.json { render action: 'show',
                             status: :created, location: @basket_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @basket_item.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /basket_items/1
  # PATCH/PUT /basket_items/1.json
  def update
    respond_to do |format|
      if @basket_item.update(basket_item_params)
        format.html { redirect_to @basket_item, notice: 'Basket item was successfully updated.' }
        format.json { render :show, status: :ok, location: @basket_item }
      else
        format.html { render :edit }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basket_items/1
  # DELETE /basket_items/1.json
  def destroy
    @basket_item.destroy

    @basket_items = BasketItem.where basket_id: session[:basket_id]
    if @basket_items.empty?
      @basket = Basket.find_by id: session[:basket_id]
      @basket.destroy
      session[:basket_id] = nil
      respond_to do |format|
        format.html { redirect_to wines_url,
                                  notice: 'Your basket is currently empty' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, notice: 'Basket item was successfully removed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basket_item
      @basket_item = BasketItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basket_item_params
      params.require(:basket_item).permit(:wine_id)
    end
end
