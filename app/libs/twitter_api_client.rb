class TwitterApiClient
  def initialize
    @client = twitter_api_client
  end

  def user_timeline(user_name)
    #@client.user_timeline(user_name).each do |timeline|
      #p @client.status(timeline.id).text
    #end
  end

  def search_yesterday_data_about(user_name)
    res = @client.search("@#{user_name}",
                         { result_type: 'mixed', until: Time.current.strftime('%F'),
                           since_id: DailyLastTweetIdForUser.last&.tweet_id || 0 })
    res.collect do |tweet|
      { text: tweet.text, tweet_id: tweet.id }
    end
  end

  private

  def twitter_api_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials[:twitter][:api_key]
      config.consumer_secret     = Rails.application.credentials[:twitter][:secret_key]
      config.access_token        = Rails.application.credentials[:twitter][:access_token]
      config.access_token_secret = Rails.application.credentials[:twitter][:access_token_secret]
    end
  end
end
