
ActiveRecord::Schema.define(version: 20171109055212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "vlogs", force: :cascade do |t|
    t.string "title"
    t.text "content"
  end

end
