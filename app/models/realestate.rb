class Realestate < ApplicationRecord
  has_many :features
  has_many :images
  belongs_to :town, optional: true
  belongs_to :user
  geocoded_by :complete_address
  after_validation :geocode, if: :address_changed
  # after_validation :change_coordinates, if: :address_changed?
  include PgSearch::Model
  pg_search_scope :search_by_location,
  against: [ :town_name, :country, :region, :province, :area, :address, :speclocation, :namestreet ],
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

  def address_changed
    address_changed? || namestreet_changed? || numberstreet_changed? || area_changed? || postcode_changed? || province_changed? || region_changed?
  end

  def change_coordinates
    results = Geocoder.search(address)
    # display_name = results.first.display_name
    lat_long = results.first.coordinates
    # rs.address = display_name
    self.latitude = lat_long[0]
    self.longitude = lat_long[1]
    self.save!
  end

  def complete_address
    if address.present?
      address
    else
      s_name = namestreet.present? && namestreet != "" ? namestreet.strip : nil
      s_number = numberstreet.present? && numberstreet != "" ? numberstreet.strip : nil
      r_area = area.present? && area != "" ? area.strip : nil
      r_postcode = postcode.present? && postcode != "" ? postcode.strip : nil
      r_province = province.present? && province != "" ? province.strip : nil
      r_region = region.present? && region != "" ? region.strip : nil
      [s_name, s_number, r_area, r_postcode, town_name, r_province, r_region].compact.join(", ")
    end
  end

  def short_address
    address = []
    street = self.speclocation || "#{self.typestreet} #{self.namestreet}"
    address << street unless street === ""
    address << self.town_name
    return address.join(', ')
  end

end
