json.array! @categories do |category|
  json.partial! 'category.json', category: category
  json.stream Stream.where(viewers: category.streams.maximum("viewers")).last, partial: 'api/v1/streams/show.json', as: :stream
  json.sub_categories category.sub_categories, partial: 'category.json', as: :category
end