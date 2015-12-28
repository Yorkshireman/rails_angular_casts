require 'rails_helper'

RSpec.describe ScreencastsController, type: :controller do
  describe '#index' do
    before :each do
      Screencast.create(title: "Fast Rails Commands",
                        summary: "Rails commands... etc",
                        duration: "8.06",
                        link: "http://railscasts.com/episodes/412-fast-rails-commands",
                        published_at: "Thu, 04 Apr 2013 00:00:00 -0700",
                        source: "railscasts",
                        video_url: "http://media.railscasts.com/assets/episodes/videos/412-fast-rails-command.mp4")
      Screencast.create(title: "Slow Rails",
                        summary: "Slow commands... etc",
                        duration: "10000:07",
                        link: "http://railscasts.com/episodes/999-slow-rails",
                        published_at: "Mon, 01 Apr 2015 00:00:00 -0700",
                        source: "railscasts",
                        video_url: "http://media.railscasts.com/assets/episodes/videos/999-slow-rails.mp4")
      get :index
      @screencasts = JSON.parse(response.body)
    end

    it 'returns all Screencasts from database' do
      expect(response.body).to eq Screencast.all.to_json
      expect(@screencasts.size).to eq 2
    end

    it "a screencast's title is present" do
      expect(@screencasts.any? { |s| s["title"] == @screencasts[0]["title"]}).to be true
    end
  end
end