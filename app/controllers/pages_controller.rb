class PagesController < ApplicationController
  skip_before_action :authenticate_user!


  def home
    @realestates = Realestate.all
    @featured_realestates = Realestate.where(featured: true)
    @town_names = Town.all.map {|t| t.name}
    @all_towns = Town.joins(:realestates).group("towns.id").order("count(towns.id) DESC").limit(6)
    @reviews = Review.all
    # @all_towns = Realestate.all.pluck(:town).uniq.sort
  end

  def dashboard
    @realestates = Realestate.all
  end

  def about_us
  end

  def our_services
  end

  def legal
  end

  def vacation_rentals
  end
end
