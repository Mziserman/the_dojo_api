json.partial! 'category.json', category: @category

json.sub_categories @category.sub_categories do |sub|
  json.partial! 'api/v1/sub_categories/sub_categories.json', sub_category: sub
  json.streams sub do |stream|
    json.array! 'api/v1/streams/show.json', stream: stream
  end
end