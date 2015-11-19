class NotesController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]
	before_action :set_note, only: [:show, :edit, :update, :destroy, :liking_users]

	def show
		#count the number of access
		@a = Note.find(params[:id])
		@a.access_count += 1
		@a.save
	end

	def new
		@note = Note.new
		@note.like_count = 0
		@note.access_count = 0
	end

	def create
		@note = current_user.notes.build(note_params)
		if @note.save
			redirect_to @note, notice: "投稿が保存されました"
		else
			@notes = Note.all.order(created_at: :desc)
			render 'home/top'
		end
	end

def edit
end

	def update
		if @note.update(note_params)
			redirect_to @note, notice: "投稿が更新されました"
		else
			render :edit
		end
	end

	def destroy
		@note.destroy
		redirect_to root_path
	end

	def liking_users
		@users = @note.liking_users
	end

	private

	def set_note
		@note = Note.find(params[:id])
	end

	def note_params
		params.require(:note).permit(:title, :content, :photo)
	end

	def correct_user
		note = Note.find(params[:id])
		if !current_user?(note.user)
			redirect_to root_path, alert: '許可されていないページです'
		end
	end
end
