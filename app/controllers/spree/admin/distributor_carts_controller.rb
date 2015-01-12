class Spree::Admin::DistributorCartsController < Spree::Admin::BaseController

	def index
		dc = DistributorCart.new
		token = dc.authenticate
		@cart = dc.get_current_cart token
	end
	
	def edit
	end

end