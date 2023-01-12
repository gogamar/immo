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
  scope :filter_by_sale, -> { self.where.not(salesprice: nil)}
  scope :filter_by_rent, -> { self.where.not(rentprice: nil)}
  scope :filter_by_reference, -> (ref) { self.where("reference ilike ?", ref) }
  scope :filter_by_town, -> (pvalues) { includes(:town).where('town.name' => pvalues) }
  scope :filter_by_rstype, -> (pvalues) { where(rstype: pvalues) }
  scope :filter_by_min, -> (min) { where('salesprice >= ?', min.to_i) }
  scope :filter_by_max, -> (max) { where('salesprice <= ?', max.to_i) }
  scope :filter_by_bedrooms, -> (bedroom_features) { where(id: bedroom_features)}


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
