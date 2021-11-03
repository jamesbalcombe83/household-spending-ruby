class ChangePrimaryKeyToBigintOnUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :id, :bigint
  end
end
