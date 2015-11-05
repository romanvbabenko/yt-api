require 'rails_helper'

describe YoutubeClient do

  it 'returns correct youtube_id' do
    url = 'https://www.youtube.com/watch?v=KBzmzdnZe14'
    client = YoutubeClient.new(url)

    expect(client.youtube_id).to eq 'KBzmzdnZe14'
  end

  it 'correctlly substitute youtube_id into API URL' do
    url = 'https://www.youtube.com/watch?v=KBzmzdnZe14'
    client = YoutubeClient.new(url)

    expect(client.youtube_url).to eq 'https://www.googleapis.com/youtube/v3/videos?part=id,snippet,statistics&id=KBzmzdnZe14&key=AIzaSyCrYTzqULvWN9b9NInDdQMpf5t5hy9zRSo'
  end

  xit 'fetch' do
    url = 'https://www.youtube.com/watch?v=KBzmzdnZe14'
    client = YoutubeClient.new(url)
    puts HTTParty.get(client.youtube_url)
    expect(client.data)
  end
  let(:h) do

  {"kind"=>"youtube#videoListResponse", "etag"=>"\"0KG1mRN7bm3nResDPKHQZpg5-do/SDIJmUx6dwvUI3L0jKp8nmcu2-o\"", "pageInfo"=>{"totalResults"=>1, "resultsPerPage"=>1}, "items"=>[{"kind"=>"youtube#video", "etag"=>"\"0KG1mRN7bm3nResDPKHQZpg5-do/FcHXkO_-eGxEVJnBf_iskEKBlgM\"", "id"=>"KBzmzdnZe14", "snippet"=>{"publishedAt"=>"2015-09-22T07:59:32.000Z", "channelId"=>"UCAHrNGn3hLC9_MilY74RCmg", "title"=>"Bull Island", "description"=>"", "thumbnails"=>{"default"=>{"url"=>"https://i.ytimg.com/vi/KBzmzdnZe14/default.jpg", "width"=>120, "height"=>90}, "medium"=>{"url"=>"https://i.ytimg.com/vi/KBzmzdnZe14/mqdefault.jpg", "width"=>320, "height"=>180}, "high"=>{"url"=>"https://i.ytimg.com/vi/KBzmzdnZe14/hqdefault.jpg", "width"=>480, "height"=>360}}, "channelTitle"=>"Rachel Quinn", "categoryId"=>"22", "liveBroadcastContent"=>"none", "localized"=>{"title"=>"Bull Island", "description"=>""}, "defaultAudioLanguage"=>"en"}, "statistics"=>{"viewCount"=>"14", "likeCount"=>"0", "dislikeCount"=>"0", "favoriteCount"=>"0", "commentCount"=>"0"}}]}
  end

  it '' do
    puts h
  end

end
