class Admin::EntriesController < ApplicationController
	# GET /admin/entries
	# GET /admin/entries.json
	def index
		@entries = Entry.open.order("created_at ASC")
	end

	# GET /admin/entries/closed
	# GET /admin/entries/closed.json
	def closed
		@entries = Entry.closed.order("created_at ASC")
	end

	# GET /admin/entries/course
	# GET /admin/entries/course.json
	def filter
		@filter = params[:course].upcase

		@entries = Entry.open.course(@filter).order("created_at ASC")
	end

	# DELETE /admin/entries/1
	# DELETE /admin/entries/1.json
	def destroy
		@entry = Entry.open.find(params[:id])

		@entry.mark_closed
		respond_to do |format|
			format.html { redirect_to admin_entries_url, notice: 'Entry was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Never trust parameters from the scary internet, only allow the white list through.
		def entry_params
			params.require(:entry).permit(:course, :name, :room, :group, :ip, :demonstration)
		end
end
