class TubesController < ApplicationController
  def index
    client = YoutubeClient.new(params[:url])
    client.fetch
    render json: client.to_json
  end
end
