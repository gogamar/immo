class Realestate < ApplicationRecord
  has_many :features
  has_many :images
  belongs_to :town
  geocoded_by :set_address if :latitude.nil?
  after_validation :geocode, if: :will_save_change_to_namestreet?
  include PgSearch::Model
  pg_search_scope :search_by_location,
  against: [ :town, :country, :region,:province, :area, :address, :speclocation, :namestreet ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
  scope :filter_by_town, -> (town) {where("similarity(town, ?) > 0.5", town)}
  scope :filter_by_rstype, -> (rstype) { where rstype: rstype }
  # scope :filter_by_starts_with, -> (name) { where("name like ?", "#{name}%")}


  def set_address
    address = "#{self.typestreet} #{self.namestreet} #{self.numberstreet}, #{self.town}"
    return address
  end


  def short_address
    address = []
    street = self.speclocation || "#{self.typestreet} #{self.namestreet}"
    address << street unless street === ""
    address << town.name
    return address.join(', ')
  end
end
