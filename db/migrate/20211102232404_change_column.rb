class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :stores, :user_id, :bigint
  end
end
