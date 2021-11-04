# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'


puts "starting seeding"
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

def seedStores
    csv_text = File.read(Rails.root.join('db/data/stores.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    csv.each do |row|
        s = Store.new
        s.name = row['name']
        s.location = row['location']
        s.store_type = row['store_type']
        s.user_id = 1
        s.save
    end
end


def seedCategories
    csv_text = File.read(Rails.root.join('db/data/categories.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    csv.each do |row|
        s = Category.new
        s.name = row['name']
        s.user_id = row['user_id']
        s.save
    end
end

seedCategories
seedStores
seedTransactions

puts "Seeding done"