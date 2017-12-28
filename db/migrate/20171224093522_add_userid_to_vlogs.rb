class AddUseridToVlogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :vlogs, :user, foreign_key: true
  end
end
