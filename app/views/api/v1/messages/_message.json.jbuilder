json.id     message.id
json.body   message.body
json.sender   do 
  json.partial! "api/v1/users/user", user: message.sender
end