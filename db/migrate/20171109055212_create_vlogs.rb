class CreateVlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :vlogs do |t|
       t.string :title
       t.text :content
    end
  end
end
