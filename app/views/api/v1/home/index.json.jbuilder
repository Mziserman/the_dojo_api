json.main @main_stream, partial: 'api/v1/streams/show.json', as: :stream

json.categories @categories do |category|
  json.partial! 'api/v1/categories/category.json', category: category
  json.sub_categories category.sub_categories, partial: 'api/v1/sub_categories/sub_categories.json', as: :sub_category
end