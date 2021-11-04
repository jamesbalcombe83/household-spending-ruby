class ChartsController < ApplicationController
    def byStore
            render json: Transaction.where("date_trunc('month', transactions.created_at)=? AND transactions.user_id=?", session[:selectedMonth]+"-01", current_user.id).joins(:store).group('stores.name').sum(:amount)
    end

    def byCategory
        render json: Transaction.where("date_trunc('month', transactions.created_at)=? AND transactions.user_id=?", session[:selectedMonth]+"-01", current_user.id).joins(:category).group('categories.name').sum(:amount)
    end

    def byWeek
        render json: Transaction.group_by_week(:created_at, last: 4).sum(:amount)
    end
end