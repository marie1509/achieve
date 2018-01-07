class AddImageToVlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :vlogs, :image, :string
  end
end
