require 'rails_helper'

RSpec.describe Screencast, type: :model do
  it{ should validate_presence_of :title }
  it{ should validate_presence_of :summary }
  it{ should validate_presence_of :duration }
  it{ should validate_presence_of :link }
  it{ should validate_presence_of :published_at }
  it{ should validate_presence_of :source }
  it{ should validate_presence_of :video_url }

  it{ should validate_uniqueness_of :video_url }

  it 'video_url uniqueness validation is case-insensitive' do
    screencast1 = Screencast.create(title: "hi", summary: 'blah', duration: '12:09', link: 'blah', published_at: Date.parse('Mon, 25 Jun 2012 00:00:00 -0700'), source: 'blah', video_url: 'video_link')
    screencast2 = Screencast.new(title: "hi", summary: 'blah', duration: '12:09', link: 'blah', published_at: Date.parse('Mon, 25 Jun 2012 00:00:00 -0700'), source: 'blah', video_url: 'viDeo_link')
    expect(screencast2.save).to be false
  end
end