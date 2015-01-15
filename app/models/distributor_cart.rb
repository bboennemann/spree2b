class DistributorCart
	# connects to the distributors backend
	require 'rubygems'
	require 'rest_client'
	require 'nokogiri'

    # gets an oAuth token for further conversation
	def authenticate
		username = "akiro.nakamura@pronto-hw.com" 
		password = "1234"
		
		oauth = 'http://localhost:9001/rest/oauth/token?client_id=mobile_android&client_secret=secret&grant_type=password&username=' + username + '&password=' + password
		client = RestClient::Resource.new(oauth,:verify_ssl => OpenSSL::SSL::VERIFY_NONE)
		response = client.get();
		@doc = Nokogiri::XML(response)
		token =  "Bearer " +  @doc.at_css("access__token").content

	end

    # checks if user already has an existing cart
	def get_existing_cart (token)
		username = "akiro.nakamura@pronto-hw.com" 

		url = 'http://localhost:9001/rest/v2/powertools/users/' + username + '/carts/current'
		client = RestClient::Resource.new(url, :verify_ssl => OpenSSL::SSL::VERIFY_NONE)

		response = client.get(:Authorization => token )

		#cart = Nokogiri::XML(response).at_css("code").content
	end

    # add new product entry to cart
	def add_product_to_cart token, cart_id, product_code, qty = 1

		username = "akiro.nakamura@pronto-hw.com" 
		product_code = '3756505'

		url = 'http://localhost:9001/rest/v2/powertools/users/' + username + '/carts/' + cart_id.to_s + '/entries?code=' + product_code.to_s + '&qty=' + qty.to_s
		puts url
		client = RestClient::Resource.new(url, :verify_ssl => OpenSSL::SSL::VERIFY_NONE)

		response = client.put(:Authorization => token )

		puts response.body	
	end

    # increase quantity of existing product in cart
	def increase_quantity token, cart_id, product_code, qty = 1
	end

    # create a new cart for user
	def create_cart
	end

    # get an existing cart instance
	def get_existing_cart
	end

    # check if specific product alreadu exists in existing cart
	def check_for_product_in_cart
	end	
end
