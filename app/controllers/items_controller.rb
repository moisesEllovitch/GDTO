class ItemsController < ApplicationController
  
  before_action :set_category, only: [:create, :show, :edit, :update, :destroy]
  before_action :set_items, only: [:index, :show]
  before_action :set_item, only: [:edit, :update, :destroy, :show]
  before_action :set_comments, only: [:show, :edit, :update, :destroy]
  # Only admin can:
  before_action :authorize_admin, only: [:edit, :update, :destroy, :new, :create]
  # Everyone can see index and show
  before_action :authorize, except: [:index, :show]

  # GET /items
  # GET /items.json
  def index
    #@items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    #@error_message = params['format']
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    # Create and save the item
    @item = @category.items.create(item_params)

    redirect_to category_path(@category)
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update_attributes(item_params)
        format.html { redirect_to @category, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to @category, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_items
      @items = @category.items
    end

    def set_item
      @item = @category.items.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:institution, :average, :category_id)
    end

    def set_comments
      @comments = @item.comments
    end

end
