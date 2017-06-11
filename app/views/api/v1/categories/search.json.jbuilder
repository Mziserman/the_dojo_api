json.popular_streams @popular_streams do |stream|
  json.partial! 'api/v1/streams/show.json', stream: stream
end

json.set! "category_streams" do
 @category_streams.each do |key, value|
    json.set! key do
      json.array! value.each do |stream|
        json.partial! 'api/v1/streams/show.json', stream: stream
      end
    end
  end
end

