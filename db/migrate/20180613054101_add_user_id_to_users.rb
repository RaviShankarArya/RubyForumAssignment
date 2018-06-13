class AddUserIdToUsers < ActiveRecord::Migration
  def change
    add_reference :forums, :user, index: true, foreign_key: true
  end
end
