json.array!(@participant_attributes) do |participant_attribute|
  json.extract! participant_attribute, :id, :participant_id, :attribute_id, :value
  json.url participant_attribute_url(participant_attribute, format: :json)
end
