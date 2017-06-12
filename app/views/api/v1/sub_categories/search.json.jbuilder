json.first_selection @first_selection do |stream|
  json.partial! 'api/v1/streams/show.json', stream: stream
end
json.second_selection @second_selection do |stream|
  json.partial! 'api/v1/streams/show.json', stream: stream
end
