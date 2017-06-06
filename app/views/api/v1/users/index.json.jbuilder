json.array! @users do |user|
  json.(user,
    :id,
    :first_name,
    :last_name,
    :email,
    :pseudo,
    :avatar,
    :live)
  json.streams user.streams, partial: 'api/v1/streams/stream.json', as: :stream
end
