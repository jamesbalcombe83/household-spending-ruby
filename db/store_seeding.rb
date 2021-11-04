require 'csv'
require_relative './data/stores.csv'

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