json.partial! 'api/v1/categories/sub_category.json', sub_category: @sub_category

json.streams @stream do |stream|
  json.partial! 'api/v1/streams/show.json', stream: stream
end
