class HomeController < ApplicationController
	def top
		if user_signed_in?
			@note = Note.new
			@notes = Note.all.order(created_at: :desc)
		else
			@message = "ようこそPorterへ！"
		end
	end

	def about
	end
	def search
	end
	def search_result
		@title = params[:title]
		@content = params[:content]
		notes = Note.all.to_a
	end
end
