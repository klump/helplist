json.array!(@break) do |entry|
  json.extract! entry, :id, :comment, :coffee, :created_at
end
