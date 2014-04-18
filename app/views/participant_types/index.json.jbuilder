json.array!(@participant_types) do |participant_type|
  json.extract! participant_type, :id, :label
  json.url participant_type_url(participant_type, format: :json)
end
