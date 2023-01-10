class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[home about_us our_services contact]
  # uncoment previous and remove the next line when I have users and login etc.
  # skip_before_action :authenticate_user!

  def home
    @realestates = Realestate.all
    @featured_realestates = Realestate.where(featured: true)
    @town_names = Town.all.map {|t| t.name}
    @all_towns = Town.joins(:realestates).group("towns.id").order("count(towns.id) DESC").limit(6)




    # @all_towns = Realestate.all.pluck(:town).uniq.sort
  end

  def about_us
  end

  def our_services
  end

  def contact
  end

  def vacation_rentals
  end
end
