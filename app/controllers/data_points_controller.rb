class DataPointsController < ApplicationController
  before_action :set_data_point, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :create
  before_action :check_key, only: :create # Super duper basic auth

  # GET /data_points
  # GET /data_points.json
  def index
    @data_points = DataPoint.all
  end

  # GET /data_points/1
  # GET /data_points/1.json
  def show
  end

  # GET /data_points/new
  def new
    @data_point = DataPoint.new
  end

  # GET /data_points/1/edit
  def edit
  end

  # POST /data_points
  # POST /data_points.json
  def create
    @data_point_collection = DataPointCollection.find_or_create_by(title: data_point_params[:collection_title])
    @data_point = DataPoint.new(data_point_params.merge(data_point_collection: @data_point_collection))

    respond_to do |format|
      if @data_point.save
        format.html { redirect_to @data_point, notice: 'Data point was successfully created.' }
        format.json { render :show, status: :created, location: @data_point }
      else
        format.html { render :new }
        format.json { render json: @data_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_points/1
  # PATCH/PUT /data_points/1.json
  def update
    respond_to do |format|
      if @data_point.update(data_point_params)
        format.html { redirect_to @data_point, notice: 'Data point was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_point }
      else
        format.html { render :edit }
        format.json { render json: @data_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_points/1
  # DELETE /data_points/1.json
  def destroy
    @data_point.destroy
    respond_to do |format|
      format.html { redirect_to data_points_url, notice: 'Data point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_point
      @data_point = DataPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_point_params
      params.require(:data_point).permit(:collection_title, :value)
    end

    def check_key
      raise 'nope'.inspect unless params[:key] == ENV['ACCESS_KEY']
    end
end
