class RemoveUserIdFromEvent < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :user_id
  end
end
