json.clinics do
    json.array! @clinics do |clinic|
      json.extract! clinic, :id, :name, :phone_number, :latitude, :longitude, :location
    end
  end