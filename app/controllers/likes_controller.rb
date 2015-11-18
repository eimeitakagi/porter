class LikesController < ApplicationController

	# イイね
	def like
		@note = Note.find(params[:note_id])
		like = current_user.likes.build(note_id: @note.id)
		like.save
		note = Note.find(:id => params[:note_id ]) 
		note.like_count += 1
		note.save
	end

	# イイね取り消し
	def unlike
		@note = Note.find(params[:note_id])
		like = current_user.likes.find_by(note_id: @note.id)
		like.destroy
		note = Note.find(:id => params[:note_id ]) 
		note.like_count -= 1
		note.save
	end
	def index
		@notes = Note.all.order("like_count DESC")
	end
end
