json.array!(@comments) do |comment|
  json.extract! comment, :id, :status_update_id, :user_id, :note
  json.url comment_url(comment, format: :json)
end
