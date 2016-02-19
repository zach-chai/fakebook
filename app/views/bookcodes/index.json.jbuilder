json.array!(@bookcodes) do |bookcode|
  json.extract! bookcode, :id, :code, :title, :format, :filename, :page_offset
  json.url bookcode_url(bookcode, format: :json)
end
