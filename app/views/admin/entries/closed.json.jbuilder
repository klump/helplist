json.array!(@entries) do |entry|
  json.extract! entry, :id, :course, :name, :room, :group, :demonstration, :created_at, :closed_at
end
