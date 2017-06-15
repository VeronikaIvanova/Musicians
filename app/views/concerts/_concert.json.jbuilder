json.extract! concert, :id, :name, :place, :date, :city, :state, :country, :created_at, :updated_at
json.url concert_url(concert, format: :json)