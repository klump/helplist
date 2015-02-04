json.array!(@entries) do |entry|
  json.extract! entry, :id, :course, :name, :room, :group, :demonstration, :created_at
end
json.array!(@current_break) do |break|
  json.extract! break, :coffee, :comment, :created_at
end
