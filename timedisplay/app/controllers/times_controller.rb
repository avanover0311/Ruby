class TimesController < ApplicationController
	def index
		@time= Time.now.asctime
	end
end
