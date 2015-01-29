class EntriesController < ApplicationController
	# GET /entries
	# GET /entries.json
	def index
		@entries = Entry.all.order("created_at ASC")
	end

	# GET /entries/new
	def new
		@entry = Entry.new
	end

	# POST /entries
	# POST /entries.json
	def create
		@entry = Entry.new(entry_params)

		respond_to do |format|
			if @entry.save
				format.html { redirect_to root_url, notice: 'Entry was successfully created.' }
				format.json { render :index, status: :created }
			else
				format.html { render :new }
				format.json { render json: @entry.errors, status: :unprocessable_entity }
			end
		end
	end

	# GET /entries/course
	# GET /entries/course.json
	def filter
		@filter = params[:course].upcase

		@entries = Entry.where( course: @filter).order("created_at ASC")
	end

	# DELETE /entries/1
	# DELETE /entries/1.json
	def destroy
		@entry = Entry.find(params[:id])

		@entry.destroy
		respond_to do |format|
			format.html { redirect_to root_url, notice: 'Entry was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Never trust parameters from the scary internet, only allow the white list through.
		def entry_params
			params.require(:entry).permit(:course, :name, :room, :group, :demonstration)
		end
end
