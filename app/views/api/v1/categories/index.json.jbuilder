json.array! @categories do |category|
  json.partial! 'category.json', category: category
  json.streams category.streams do |stream|
    json.partial! 'api/v1/streams/show.json', stream: stream
  end
  json.sub_categories category.sub_categories, partial: 'category.json', as: :category
end
