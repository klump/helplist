json.array!(@breaks) do |break|
  json.extract! break, :id, :course, :message
  json.url break_url(break, format: :json)
end
