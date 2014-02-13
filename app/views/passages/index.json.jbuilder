json.array!(@passages) do |passage|
  json.extract! passage, :id, :name, :text, :read_on
  json.url passage_url(passage, format: :json)
end
