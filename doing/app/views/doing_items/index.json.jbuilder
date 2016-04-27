json.array!(@doing_items) do |doing_item|
  json.extract! doing_item, :id, :title, :deadline, :priority, :complete, :description
  json.url doing_item_url(doing_item, format: :json)
end
