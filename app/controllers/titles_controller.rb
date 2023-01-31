class TitlesController < ApplicationController
  before_action :set_title, only: %i[ show edit update destroy ]

  # GET /titles or /titles.json
  def index
    @titles = policy_scope(Title)
  end

  # GET /titles/1 or /titles/1.json
  def show
    authorize @title
  end

  # GET /titles/new
  def new
    @title = Title.new
    authorize @title
  end

  # GET /titles/1/edit
  def edit
    authorize @title
  end

  # POST /titles or /titles.json
  def create
    @title = Title.new(title_params)
    @title.user = current_user
    authorize @title

    respond_to do |format|
      if @title.save
        format.html { redirect_to title_url(@title), notice: "Title was successfully created." }
        format.json { render :show, status: :created, location: @title }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /titles/1 or /titles/1.json
  def update
    authorize @title
    respond_to do |format|
      if @title.update(title_params)
        format.html { redirect_to title_url(@title), notice: "Title was successfully updated." }
        format.json { render :show, status: :ok, location: @title }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titles/1 or /titles/1.json
  def destroy
    authorize @title
    @title.destroy

    respond_to do |format|
      format.html { redirect_to titles_url, notice: "Title was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_title
      @title = Title.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def title_params
      params.require(:title).permit(:bheader1, :bheader2, :bdheader1, :bdheader2, :bbutton, :video)
    end
end
