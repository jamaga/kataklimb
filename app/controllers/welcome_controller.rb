class WelcomeController < ApplicationController
	def index
		render 'welcome_page'		
	end	

	def about
		render 'about_page'
	end
end
