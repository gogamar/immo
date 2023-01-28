class WebrealestatesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :set_webrealestate, only: %i[ show edit update destroy ]

  # GET /webrealestates or /webrealestates.json
  def index
    @webrealestates = policy_scope(Webrealestate)
  end

  # GET /webrealestates/1 or /webrealestates/1.json
  def show
    authorize @webrealestate
  end

  # GET /webrealestates/new
  def new
    @webrstypes = [["Pis", 1], ["Casa", 2], ["Local", 3], ["Terreny", 4],["Garatge", 5],["Oficina", 6],["Negoci", 7],["Altres", 8]]
    @webrealestate = Webrealestate.new
    authorize @webrealestate
  end

  # GET /webrealestates/1/edit
  def edit
    authorize @webrealestate
  end

  # POST /webrealestates or /webrealestates.json
  def create
    @webrealestate = Webrealestate.new(webrealestate_params)
    authorize @webrealestate
    respond_to do |format|
      if @webrealestate.save
        format.html { redirect_to thank_you_path, notice: "Gràcies per afegir el teu immoble. Aviat et contactarem!" }
        format.json { render :show, status: :created, location: @webrealestate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @webrealestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webrealestates/1 or /webrealestates/1.json
  def update
    authorize @webrealestate
    respond_to do |format|
      if @webrealestate.update(webrealestate_params)
        format.html { redirect_to webrealestate_url(@webrealestate), notice: "Webrealestate was successfully updated." }
        format.json { render :show, status: :ok, location: @webrealestate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @webrealestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webrealestates/1 or /webrealestates/1.json
  def destroy
    authorize @webrealestate
    @webrealestate.destroy

    respond_to do |format|
      format.html { redirect_to webrealestates_url, notice: "Webrealestate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webrealestate
      @webrealestate = Webrealestate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def webrealestate_params
      params.require(:webrealestate).permit(:status, :webrstype, :operation, :price, :address, :surface, :bedrooms, :terrace, :lift, :owner, :email, :phone, photos: [])
    end
end
