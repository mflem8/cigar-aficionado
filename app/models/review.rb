class Review < ApplicationRecord
  belongs_to :user
  belongs_to :cigar

  validates :title, presence: true
  validates :matches, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
  
  validates :cigar_id, uniqueness: { scope: :user }
end
