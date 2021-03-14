json.cache! @comments do
  json.array! @comments, partial: "api/comments/comment", as: :comment
end