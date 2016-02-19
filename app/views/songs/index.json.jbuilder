json.array!(@songs) do |song|
  json.extract! song, :id, :bookcode, :page, :title
  json.url song_url(song, format: :json)
end
