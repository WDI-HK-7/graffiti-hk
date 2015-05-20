json.array! @posts do |post|
  json.id @post.id 
  json.artist @post.artist 
  json.caption @post.caption 
  json.address @post.address 
  json.picture post.picture
  
  json.comments post.comments do |comment|
    json.content comment.content
    json.created_at comment.created_at
    json.user_id comment.user_id
  end
end 

