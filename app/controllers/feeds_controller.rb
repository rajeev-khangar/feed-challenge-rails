require "httparty"
class FeedsController < ApplicationController
  def index 
  	@result = HTTParty.get("https://feed-challenge-api.herokuapp.com/activities")
    data = []
    @result.parsed_response.each do |record|
      if record["object"].split(":").first == "Post"
        post = HTTParty.get("https://feed-challenge-api.herokuapp.com/posts/#{record["object"].split(":").last}")
        data << {verb: record["verb"], content: post["content"], actor: record["actor"], description: record["actor"]+ " " + record["verb"] + " "+ post["content"]}
      else
      	share = HTTParty.get("https://feed-challenge-api.herokuapp.com/shares/#{record["object"].split(":").last}")
        data << {verb: record["verb"], url: share["url"], actor: record["actor"], description: record["actor"] + " " + record["verb"] + " "+ share["url"]}
      end
    end
    render json: data.to_json
  end
end
