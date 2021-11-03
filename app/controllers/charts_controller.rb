class ChartsController < ApplicationController
    def user_transactions

            render json: Transaction.where(user_id: current_user.id).joins(:store).group('stores.name').sum(:amount)

    end
end