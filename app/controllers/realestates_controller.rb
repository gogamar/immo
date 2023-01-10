class RealestatesController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_realestate, only: %i[ show edit update destroy ]

  # GET /realestates or /realestates.json

  def index
    @all_towns = Town.all.pluck(:name)
    @all_rstypes = Realestate.all.pluck(:rstype).uniq
    @all_salesprices = Realestate.all.pluck(:salesprice)
    i = 40000
    salesprices_1 = Array.new(18){i+=20000}
    salesprices_2 = Array.new(12){i+=50000}
    salesprices_3 = Array.new(10){i+=100000}
    @salesprices_array = salesprices_1 + salesprices_2 + salesprices_3

    @all_operations = [ "Comprar", "Llogar", "Vacances" ]


    if params.values.include? "Comprar"
      @all_realestates = Realestate.where.not(salesprice: nil)
    elsif params.values.include? "Llogar"
      @all_realestates = Realestate.where.not(rentprice: nil)
    elsif params[:ref].present?
      @all_realestates = Realestate.where("reference ilike ?", params[:ref])
    else
      @all_realestates = Realestate.where(nil)
    end

    if (params.values & @all_towns).length > 0
      @all_realestates = @all_realestates.includes(:town).where('town.name' => params.values)
    elsif (params.values & @all_rstypes).length > 0
      @all_realestates = @all_realestates.where(rstype: params.values)
    # elsif params[:municipi].present? && params[:column].present?
    #   @all_realestates = Realestate.where("similarity(town, ?) > 0.5", "%#{params[:municipi]}%").or(Realestate.where("town ilike ?", "%#{params[:municipi]}%")).order("#{params[:column]} #{params[:direction]}")
    # elsif params[:municipi].present?
    #   @all_realestates = Realestate.where("similarity(town, ?) > 0.5", "%#{params[:municipi]}%").or(Realestate.where("town ilike ?", "%#{params[:municipi]}%"))
    # elsif params[:column].present?
    #   @all_realestates = @all_realestates.order("#{params[:column]} #{params[:direction]}")
    end
    @all_realestates = @all_realestates.order("#{params[:column]} #{params[:direction]}")
    @pagy, @realestates = pagy(@all_realestates, page: params[:page], items: 5) if @all_realestates
    @towns = @all_realestates.map {|rs| rs.town.name}.uniq if @all_realestates
    if params.values.include? "Vacances"
      redirect_to "/lloguer-turistic"
    end
  end

  def index_map
    all_realestates = Realestate.all
    if params[:municipi].present?
      all_realestates = Realestate.where("similarity(town, ?) > 0.5", "%#{params[:municipi]}%")
    else
      all_realestates = Realestate.all
    end
    @pagy, @realestates = pagy(all_realestates, page: params[:page], items: 10)
    @geocoded_realestates = @realestates.where.not(latitude: nil)
    @markers = @geocoded_realestates.map do |realestate|
      {
        lat: realestate.latitude,
        lng: realestate.longitude,
        info_window: render_to_string(partial: "info_window", locals: {realestate: realestate}),
        image_url: helpers.asset_url("location.png"),
        # image_url: realestate.images.first.url,
        price: number_to_currency(realestate.rentprice, unit: "€", separator: ",", delimiter: ".", precision: 2) || number_to_currency(realestate.salesprice, unit: "€", separator: ",", delimiter: ".", precision: 2) || "Consultar preu"
      }
    end
  end

  # GET /realestates/1 or /realestates/1.json
  def show
  end

  # GET /realestates/new
  def new
    @realestate = Realestate.new
  end

  # GET /realestates/1/edit
  def edit
  end

  # POST /realestates or /realestates.json
  def create
    @realestate = Realestate.new(realestate_params)

    respond_to do |format|
      if @realestate.save
        format.html { redirect_to realestate_url(@realestate), notice: "Realestate was successfully created." }
        format.json { render :show, status: :created, location: @realestate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @realestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /realestates/1 or /realestates/1.json
  def update
    respond_to do |format|
      if @realestate.update(realestate_params)
        format.html { redirect_to realestate_url(@realestate), notice: "Realestate was successfully updated." }
        format.json { render :show, status: :ok, location: @realestate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @realestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /realestates/1 or /realestates/1.json
  def destroy
    @realestate.destroy

    respond_to do |format|
      format.html { redirect_to realestates_url, notice: "Realestate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realestate
      @realestate = Realestate.find(params[:id])
    end

    # A list of the param names that can be used for filtering the Product list
    def filtering_params(params)
      params.slice(:town, :rstype)
    end

    # Only allow a list of trusted parameters through.
    def realestate_params
      params.require(:realestate).permit(:idfile, :idagency, :type, :reference, :country, :speclocation, :typestreet, :namestreet, :numberstreet, :featured, :usurface, :csurface, :salesprice, :rentprice, :region, :province, :town, :postcode, :area, :title, :ad, :address, :latitude, :longitude)
    end
end
