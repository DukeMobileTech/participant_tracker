json.array!(@attributes) do |attribute|
  json.extract! attribute, :id, :label, :type, :required
  json.url attribute_url(attribute, format: :json)
end
