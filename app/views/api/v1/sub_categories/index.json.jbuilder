json.array! @sub_categories do |sub_category|
  json.partial! 'sub_category.json', sub_category: sub_category
  json.streams sub_category.streams do |stream|
    json.partial! 'api/v1/streams/show.json', stream: stream
  end
end
