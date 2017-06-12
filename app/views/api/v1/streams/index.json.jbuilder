json.array! @streams do |stream|
  json.partial! 'stream.json', stream: stream
  json.user stream.user, partial: 'api/v1/users/show_public.json', as: :user
  json.category stream.category, partial: 'api/v1/categories/category.json', as: :category
  json.sub_categories stream.sub_categories,
    partial: 'api/v1/sub_categories/sub_category.json', as: :sub_category
end
