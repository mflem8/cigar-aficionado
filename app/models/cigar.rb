class Cigar < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews

  validates :style, presence: true
  validate :not_a_duplicate

  def brand_attributes=(attributes)
    brand = Brand.find_or_create_by(attributes) if !attributes['name'].empty?
  end

  def not_a_duplicate
    cigar = Cigar.find_by(style: style, brand_id: brand_id)
    if !!cigar && cigar != self
      errors.add(:style, 'has already been added for that brand')
    end
  end

  def brand_and_style
    "#{brand.name} - #{style}"
  end

  def self.atoz
    order(:brand)
  end

end
