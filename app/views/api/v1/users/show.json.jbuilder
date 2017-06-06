# json.(@user, :id, :email, :authentication_token)
# json.(@user, :id, :first_name, :last_name, :email, :pseudo, :avatar,
#     :live, :authentication_token)
json.partial! 'api/v1/users/show_private.json', user: @user

json.streams @user.streams, partial: 'api/v1/streams/stream.json', as: :stream
