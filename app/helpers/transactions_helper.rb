module TransactionsHelper
    include Pagy::Frontend
    def calculateTotal
        Transaction.where("date_trunc('month', created_at)=? AND user_id=?", session[:selectedMonth]+"-01", current_user.id).sum(:amount)
    end
end
