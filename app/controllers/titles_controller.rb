class TitlesController < ApplicationController
  include TranslateHelper
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
    @title.assign_attributes(
      bheader1_es: translate_string(@title.bheader1, "es"),
      bheader1_en: translate_string(@title.bheader1, "en"),
      bheader1_fr: translate_string(@title.bheader1, "fr")
    )
    authorize @title
    @title.save

    if @title.save
      redirect_to edit_title_path(@title), notice: "Title was successfully saved and translated. Now you can retouch the translations if you want."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update
    authorize @title
      if params[:commit] == "Save translations"
        new_text = params[:title][:bheader1]
        @title.update(
          bheader1: new_text,
          bheader1_en: translate_string(new_text, "en"),
          bheader1_es: translate_string(new_text, "es"),
          bheader1_fr: translate_string(new_text, "fr")
        )
        if @title.save
          redirect_to edit_title_path(@title), notice: "Translations successfully saved."
        else
          render :edit, status: :unprocessable_entity
        end
      elsif params[:commit] == "Save"
        if @title.update(title_params)
          redirect_to edit_title_path(@title), notice: "Title was successfully updated."
        else
          render :edit, status: :unprocessable_entity
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
