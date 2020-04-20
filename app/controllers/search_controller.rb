class SearchController < ApplicationController

	def search
		@range = params[:range]
		search = params[:search]
		word = params[:word]
		if @range == "1"
			@users = User.search(search, word)
		elsif @range == "2"
			@books = Book.search(search, word)
		end
	end
end
