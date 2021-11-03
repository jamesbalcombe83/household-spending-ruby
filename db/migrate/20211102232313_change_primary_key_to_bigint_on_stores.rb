class ChangePrimaryKeyToBigintOnStores < ActiveRecord::Migration[6.1]
  def change
    change_column :stores, :id, :bigint
  end
end
