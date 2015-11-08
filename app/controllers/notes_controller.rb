class NotesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_tag
	before_action :check_notes, only: [:new, :create]
	
	def new
		@note = Note.new
	end

	def create
		@note = current_user.notes.new note_params
		@note.tag = @tag
		if @note.save
			redirect_to @tag , notice: 'Added the note!'
		else
			redirect_to @tag, notice: "Can't add this dude"
		end
	end

	def edit
		
	end

	private

	def find_tag
		@tag = Tag.friendly.find(params[:tag_id])
	end

	def note_params
		params.require(:note).permit(:title)
	end

	def check_notes
		#asdf
		if current_user.tags.include?(@tag )
			redirect_to @tag, notice: 'dude you already a note'
		end
	end

end
