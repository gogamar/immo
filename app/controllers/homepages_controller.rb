class HomepagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_homepage, only: %i[ show edit update destroy ]

  # GET /homepages
  def index
    @homepages = policy_scope(Homepage)
  end

  # GET /homepages/1
  def show
    authorize @homepage
    @realestates = Realestate.all
    @featured_realestates = Realestate.where(featured: true)
    @town_names = Realestate.all.pluck(:town_name).uniq.compact.sort
    @all_towns = Town.joins(:photo_attachment).joins(:realestates).group("towns.id").order("count(towns.id) DESC").limit(6)
    @reviews = Review.all
    @typedtext = [@homepage.bdheader1, @homepage.bdheader2]
  end

  # GET /homepages/new
  def new
    @homepage = Homepage.new
    authorize @homepage
  end

  # GET /homepages/1/edit
  def edit
    authorize @homepage
  end

  # POST /homepages
  def create
    @homepage = Homepage.new(homepage_params)
    authorize @homepage

    if @homepage.save
      redirect_to @homepage, notice: "Homepage was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /homepages/1
  def update
    authorize @homepage
    if @homepage.update(homepage_params)
      redirect_to @homepage, notice: "Homepage was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /homepages/1
  def destroy
    authorize @homepage
    @homepage.destroy
    redirect_to homepages_url, notice: "Homepage was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homepage
      set_homepage = 1
      @homepage = Homepage.find(set_homepage)
    end

    # Only allow a list of trusted parameters through.
    def homepage_params
      params.require(:homepage).permit(:bheader1, :bheader2, :bdheader1, :bdheader2, :bbutton)
    end
end
