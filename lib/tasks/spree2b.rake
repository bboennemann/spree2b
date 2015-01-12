namespace :spree2b do
	require 'csv'
  desc "Importing products from CSV"
  task import_products: :environment do

  	timer =  Time.now
  	
  	shipping_category = Spree::ShippingCategory.find_by_name!("Default")
  	tax_category = Spree::TaxCategory.find_by_name!("Clothing")

  	file = "#{Rails.root}/data/products.csv"
	CSV.foreach(file, :headers => true) do |row|

		puts row[0] + " : " + row[7]

		Spree::Config[:currency] = "USD"

		product = Spree::Product.find_or_initialize_by(name: row[0])

		product.description = row[1]
		product.price = row[2]
		product.tax_category = tax_category
		product.shipping_category = shipping_category
		product.available_on = timer
		product.sku = row[7]

		product.save!

		Spree::Config[:currency] = "EUR"
		product.reload
		product.price = row[3]
		product.shipping_category = shipping_category

		product.save!


	end

	puts "Total duration of import: " + (Time.now - timer).to_s
  end

end
