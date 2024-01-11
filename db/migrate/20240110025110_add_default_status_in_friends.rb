class AddDefaultStatusInFriends < ActiveRecord::Migration[7.0]
  def change
    change_column_default :friendships, :status, from: nil, to: false
  end
end
