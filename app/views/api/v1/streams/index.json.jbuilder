json.data do
  json.array! @streams do |stream|
    json.partial! 'api/v1/streams/stream', stream: stream
  end
end
