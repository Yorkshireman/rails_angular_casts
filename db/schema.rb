ActiveRecord::Schema.define(version: 20151223211902) do

  create_table "screencasts", force: :cascade do |t|
    t.string   "title"
    t.text     "summary"
    t.string   "duration"
    t.string   "link"
    t.datetime "published_at"
    t.string   "source"
    t.string   "video_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end