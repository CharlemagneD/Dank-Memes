json.array!(@memes) do |meme|
  json.extract! meme, :id, :meme_type, :top_text, :bottom_text, :rating
  json.url meme_url(meme, format: :json)
end
