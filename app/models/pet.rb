class Pet < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one :new_owner, through: :purchase, source: :user

  def self.available_pets
    Pet.left_outer_joins(:purchase).where(purchase: { pet_id: nil })
  end
end