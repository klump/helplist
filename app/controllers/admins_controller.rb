class AdminsController < ApplicationController
	http_basic_authenticate_with name: "nsastaff", password: "Syp9595"

	def show
		@break = Break.new
	end
end
