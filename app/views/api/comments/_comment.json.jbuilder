json.id comment.id
json.content comment.content
json.created_at comment.created_at

json.user do
  json.id comment.user.id
  json.name comment.user.name
  json.email comment.user.email
end