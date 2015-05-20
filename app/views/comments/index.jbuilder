json.array! @comment do |comment|
  json.id comment.id
  json.user_id comment.user_id
  json.post_id comment.post_id
end