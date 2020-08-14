class TwitterApiClient
  def initialize
    @client = twitter_api_client
  end

  def user_timeline(user_name)
    @client.user_timeline(user_name).each do |timeline|
      p @client.status(timeline.id).text
    end
  end

  def search_yesterday_data_about(user_name)
    p 'search_yesterday_data_about'
    @client.search("@#{user_name}", result_type: 'recent',
                   since: Time.current.yesterday.strftime('%F'),
                   until: Time.current.strftime('%F')).take(3).collect do |tweet|
      p "#{tweet.user.screen_name}: #{tweet.text}"
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
