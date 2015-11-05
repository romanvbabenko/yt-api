class YoutubeClient

  attr_reader :url, :channel_data, :youtube_id, :data

  def initialize(url)
    @url = url
  end

  # https://www.youtube.com/embed/KBzmzdnZe14
  # https://www.youtube.com/watch?v=KBzmzdnZe14
  # https://youtu.be/KBzmzdnZe14
  def youtube_id
    @youtube_id = url =~ /=/ ? url.split('=').last : url.split('/').last
  end

  def youtube_url
    @youtube_url ||= "https://www.googleapis.com/youtube/v3/videos?part=id,snippet,statistics&id=#{youtube_id}&key=AIzaSyCrYTzqULvWN9b9NInDdQMpf5t5hy9zRSo"
  end

  def fetch
    @data ||= HTTParty.get(youtube_url)
    @channel_data ||= HTTParty.get(channel_url)
  end

  def channel_url
    "https://www.googleapis.com/youtube/v3/channels?part=snippet&id=#{channel_id}&key=AIzaSyCrYTzqULvWN9b9NInDdQMpf5t5hy9zRSo"
  end

  def channel_id
    data['items'].first['snippet']['channelId']
  end

  # utils
  def data_snippet
    data['items'].first['snippet']
  end

  def channel_snippet
    channel_data['items'].first['snippet']
  end

  def channel_author_thumbnail_url
    channel_snippet['thumbnails']['default']['url']
  end

  def channel_author_url
    "https://www.youtube.com/channel/#{channel_id}"
  end

  def to_json
    {provider: 'Youtube', id: youtube_id, title: data_snippet['title'],
     channel_id: channel_id,
     author: { title: channel_snippet['title'],
               url: channel_author_url,
               thumbnail: channel_author_thumbnail_url}
    }
  end
end
