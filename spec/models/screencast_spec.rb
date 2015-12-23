require 'rails_helper'

RSpec.describe Screencast, type: :model do
  it{ should validate_presence_of :title }
  it{ should validate_presence_of :summary }
  it{ should validate_presence_of :duration }
  it{ should validate_presence_of :link }
  it{ should validate_presence_of :published_at }
  it{ should validate_presence_of :source }
  it{ should validate_presence_of :video_url }
end