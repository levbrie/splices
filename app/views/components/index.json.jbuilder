json.array!(@components) do |component|
  json.extract! component, :id, :name, :description, :repository_url, :component_path
  json.url component_url(component, format: :json)
end
