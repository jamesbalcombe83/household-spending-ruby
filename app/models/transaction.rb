class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :store
  belongs_to :category
end
