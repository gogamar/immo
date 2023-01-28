class PagesController < ApplicationController
  skip_before_action :authenticate_user!


  def home
    @realestates = Realestate.all
    @featured_realestates = Realestate.where(featured: true)
    @town_names = Realestate.all.pluck(:town_name).uniq.compact.sort
    @all_towns = Town.joins(:photo_attachment).joins(:realestates).group("towns.id").order("count(towns.id) DESC").limit(6)
    @reviews = Review.all

  end

  def dashboard
    @realestates = Realestate.all
    @webrealestates = Webrealestate.all
    @user_realestates = Realestate.where(user_id: current_user.id)
  end

  def about_us
  end

  def our_services
  end

  def legal
  end

  def vacation_rentals
  end

  def thank_you
  end
end
