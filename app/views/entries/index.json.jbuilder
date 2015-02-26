json.array!(@entries) do |entry|
  json.extract! entry, :id, :course, :name, :room, :group, :demonstration, :created_at
end
json.array!(@current_break) do |current_break|
  json.extract! current_break, :coffee, :comment, :created_at
end
