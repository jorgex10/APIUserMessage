json.partial! "message", message: @message
json.receivers do
  json.array! @message.receivers do |receiver|
    json.partial! "api/v1/users/user", user: receiver
  end
end