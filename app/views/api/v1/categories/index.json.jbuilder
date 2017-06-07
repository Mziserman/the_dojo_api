json.array! @categories do |category|
  json.partial! 'category.json', category: category
end