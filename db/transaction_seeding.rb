require 'csv'
require_relative './data/transactions.csv'

def seedTransactions
    csv_text = File.read(Rails.root.join('db/data/transactions.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    csv.each do |row|
        s = Transaction.new
        s.user_id = row['user_id']
        s.store_id = row['store_id']
        s.category_id = row['category_id']
        s.amount = row['amount']
        s.created_at = row['created_at']
        s.save
    end
end