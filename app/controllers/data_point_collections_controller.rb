class DataPointCollectionsController < ApplicationController
  before_action :set_data_point_collection, only: [:show, :edit, :update, :destroy]

  # GET /data_point_collections
  # GET /data_point_collections.json
  def index
    @data_point_collections = DataPointCollection.all
  end

  # GET /data_point_collections/1
  # GET /data_point_collections/1.json
  def show
  end

  # GET /data_point_collections/new
  def new
    @data_point_collection = DataPointCollection.new
  end

  # GET /data_point_collections/1/edit
  def edit
  end

  # POST /data_point_collections
  # POST /data_point_collections.json
  def create
    @data_point_collection = DataPointCollection.new(data_point_collection_params)

    respond_to do |format|
      if @data_point_collection.save
        format.html { redirect_to @data_point_collection, notice: 'Data point collection was successfully created.' }
        format.json { render :show, status: :created, location: @data_point_collection }
      else
        format.html { render :new }
        format.json { render json: @data_point_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_point_collections/1
  # PATCH/PUT /data_point_collections/1.json
  def update
    respond_to do |format|
      if @data_point_collection.update(data_point_collection_params)
        format.html { redirect_to @data_point_collection, notice: 'Data point collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_point_collection }
      else
        format.html { render :edit }
        format.json { render json: @data_point_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_point_collections/1
  # DELETE /data_point_collections/1.json
  def destroy
    @data_point_collection.destroy
    respond_to do |format|
      format.html { redirect_to data_point_collections_url, notice: 'Data point collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_point_collection
      @data_point_collection = DataPointCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_point_collection_params
      params.require(:data_point_collection).permit(:title, :description)
    end
end
