json.partial! 'api/v1/streams/stream.json', stream: stream
json.user stream.user, partial: 'api/v1/users/show_public.json', as: :user
json.category stream.category, partial: 'api/v1/categories/category.json', as: :category
