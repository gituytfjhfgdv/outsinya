namespace :twitter_activities_daily_record do
  desc '前日のユーザに関する記載を取得して、特定の文言が含まれていたら、カウントする'
  task count_specific_words: :environment do
    # 1. twitter apiをよんで前日分に発行されたユーザのデータを取得
    # 2. そのデータの中から特定の単語が何度入ってるかを数えてdbに入れる
    #
    return unless Rails.env.production?

    tw = TwitterApiClient.new

    User.find_each do |user|
      twitter_text_array = tw.search_yesterday_data_about(user.nickname)

      user.personal_words.each do |word|
        regexp = Regexp.union(word.content)
        written_count = twitter_text_array.join(' ').scan(regexp).to_a.length

        DailyUserWordRecord.create(user: user, personal_word: word,
                                   count: written_count, created_on: Time.current,
                                   all_daily_word_count: twitter_text_array.length)
      end
    end
  end
end
