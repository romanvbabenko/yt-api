require 'rails_helper'

describe '/tubes' do

  it 'return proper json' do
    get '/tubes', url: 'https://www.youtube.com/watch?v=KBzmzdnZe14'

    expect(response.status).to eq 200
  end

end
