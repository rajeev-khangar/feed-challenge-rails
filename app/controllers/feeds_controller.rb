require "httparty"
class FeedsController < ApplicationController
  
  def index
    if request.xhr?
      feed = Feed.new    
      result = feed.call("activities")
      data = []
      result.parsed_response.each do |record|
        data << if record["verb"] == "posted"
          feed.post_data(record, "posts/#{record['object'].split(':').last}")
        elsif record["verb"] == "shared" 
          feed.share_data(record, "shares/#{record['object'].split(':').last}")
        end
      end
      render json: data.to_json
    end
  end

end
