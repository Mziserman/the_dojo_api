json.partial! 'api/v1/categories/category.json', category: @category

json.streams @stream do |stream|
  json.partial! 'api/v1/streams/show.json', stream: stream
end