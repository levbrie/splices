json.array!(@applications) do |application|
  json.extract! application, :id, :user_id, :name, :description, :repository_url, :framework
  json.url application_url(application, format: :json)
end
