class DoingItemsController < ApplicationController
  before_action :set_doing_item, only: [:show, :edit, :update, :destroy]

  # GET /doing_items
  # GET /doing_items.json
  def index
    @doing_items = DoingItem.all
  end

  # GET /doing_items/1
  # GET /doing_items/1.json
  def show
  end

  # GET /doing_items/new
  def new
    @doing_item = DoingItem.new
  end

  # GET /doing_items/1/edit
  def edit
  end

  # POST /doing_items
  # POST /doing_items.json
  def create
    @doing_item = DoingItem.new(doing_item_params)

    respond_to do |format|
      if @doing_item.save
        format.html { redirect_to @doing_item, notice: 'Doing item was successfully created.' }
        format.json { render :show, status: :created, location: @doing_item }
      else
        format.html { render :new }
        format.json { render json: @doing_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doing_items/1
  # PATCH/PUT /doing_items/1.json
  def update
    respond_to do |format|
      if @doing_item.update(doing_item_params)
        format.html { redirect_to @doing_item, notice: 'Doing item was successfully updated.' }
        format.json { render :show, status: :ok, location: @doing_item }
      else
        format.html { render :edit }
        format.json { render json: @doing_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doing_items/1
  # DELETE /doing_items/1.json
  def destroy
    @doing_item.destroy
    respond_to do |format|
      format.html { redirect_to doing_items_url, notice: 'Doing item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doing_item
      @doing_item = DoingItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doing_item_params
      params.require(:doing_item).permit(:title, :deadline, :priority, :complete, :description)
    end
end
