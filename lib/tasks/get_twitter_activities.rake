namespace :get_twitter_activities do
  desc '前日のユーザに関する記載を取得して、特定の文言が含まれていたら、カウントする'
  task count_specific_words: :environment do
    # 1. twitter apiを読んで前日分に発行されたユーザのデータを取得
    # 2. そのデータの中から特定の単語が何度入ってるかを数えてdbに入れる
    #
    tw = TwitterApiClient.new

    User.find_each do |user|
      twitter_text_array = tw.search_yesterday_data_about(user.nickname)

      # 全体での数字を入れるならこれでもいいかも
      #user_negative_words = user.negative_words.pluck(:content)
      #negative_count = twitter_text_array.join(' ').scan(Regexp.union(user_negative_words)).length
      #user_positive_words = user.positive_words.pluck(:content)
      #positive_count = twitter_text_array.join(' ').scan(Regexp.union(user_positive_words)).length

      # 単語ごとにカウントしてデータ作る場合 ほげ->5回など
      user.negative_words.each do |word|
        regexp = Regexp.union(word)
        written_count = twitter_text_array.join(' ').scan(regexp).to_a.length
        DailyUserWordWrittenCount.create(user: user, word: word,
                                         count: written_count)
      end

      user.positive_words.each do |word|
        regexp = Regexp.union(word)
        written_count = twitter_text_array.join(' ').scan(regexp).to_a.length
        DailyUserWordWrittenCount.create(user: user, word: word,
                                         count: written_count)
      end
    end
  end
end
