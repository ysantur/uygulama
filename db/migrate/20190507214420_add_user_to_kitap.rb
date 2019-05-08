class AddUserToKitap < ActiveRecord::Migration[5.2]
  def change
    add_reference :kitaps, :user, foreign_key: true
  end
end
