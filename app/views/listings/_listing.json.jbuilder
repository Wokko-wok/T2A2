json.extract! listing, :id, :user_id, :species, :age, :price, :name, :description, :sold, :created_at, :updated_at
json.url listing_url(listing, format: :json)
json.description listing.description.to_s
