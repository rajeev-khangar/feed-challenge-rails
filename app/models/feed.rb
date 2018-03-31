class Feed

  def initialize
    @url = "https://feed-challenge-api.herokuapp.com/"
  end

  def call(action)
    HTTParty.get("#{@url}#{action}")
  end

  def post_data(record, action)
    post = call(action)
    { verb: record["verb"], content: post["content"], actor: record["actor"], description: record["actor"]+ " " + record["verb"] + " "+ post["content"] }
  end

  def share_data(record, action)
    share = call(action)
    { verb: record["verb"], url: share["url"], actor: record["actor"], description: record["actor"] + " " + record["verb"] + " "+ share["url"] }
  end  

end