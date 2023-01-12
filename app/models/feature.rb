class Feature < ApplicationRecord
  belongs_to :realestate
  validates :name, :presence => true, :uniqueness => {:scope => :realestate_id}

  def self.duplicate_features
    unique = self.select('DISTINCT ON(features.name, features.realestate_id) features.id')
     .order(:name, :realestate_id, :id)
    self.where.not(id: unique)
  end
end
