class Listing < ApplicationRecord
  belongs_to :user
  has_rich_text :description
  has_one_attached :picture

  has_one :purchase
  has_one :new_owner, through: :purchase, source: :user

  def self.available_listings
    Listing.left_outer_joins(:purchase).where(purchase: { listing_id: nil })
  end

  def sold?
    !!purchase
  end
end
