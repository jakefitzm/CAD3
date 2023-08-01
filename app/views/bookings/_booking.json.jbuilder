json.extract! booking, :id, :name, :date, :time, :size, :note, :created_at, :updated_at
json.url booking_url(booking, format: :json)
