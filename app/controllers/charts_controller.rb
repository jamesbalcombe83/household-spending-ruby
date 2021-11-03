class ChartsController < ApplicationController
    def user_transactions
            render json: Transaction.where("date_trunc('month', transactions.created_at)=? AND transactions.user_id=?", session[:selectedMonth]+"-01", current_user.id).joins(:store).group('stores.name').sum(:amount)
    end
end