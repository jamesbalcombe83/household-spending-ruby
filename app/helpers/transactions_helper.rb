module TransactionsHelper
    def calculateTotal
        @transactions.sum(:amount)
    end
end
