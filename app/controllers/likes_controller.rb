class LikesController < ApplicationController

	# イイね
	def like
		@note = Note.find(params[:note_id])
		like = current_user.likes.build(note_id: @note.id)
		like.save
	end

	# イイね取り消し
	def unlike
		@note = Note.find(params[:note_id])
		like = current_user.likes.find_by(note_id: @note.id)
		like.destroy
	end
end
