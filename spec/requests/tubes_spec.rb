require 'rails_helper'

describe '/tubes' do

  it 'return proper json' do
    get '/tubes', url: 'https://www.googleapis.com/youtube/v3/videos?part=id,snippet,statistics&id=KBzmzdnZe14&key=AIzaSyCrYTzqULvWN9b9NInDdQMpf5t5hy9zRSo'

    expect(response.status).to eq 200
  end

end
