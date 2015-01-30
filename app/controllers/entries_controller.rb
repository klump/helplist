class EntriesController < ApplicationController
	# GET /entries
	# GET /entries.json
	def index
		@entries = Entry.all.order("created_at ASC")
	end

	# GET /entries/new
	def new
		@entry = Entry.new

		# try to get the room and group from the IP address
		remote_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip

		if remote_ip =~ /\A10.(\d{1,3}).(\d{1,3}).\d{1,3}\Z/
			room = $1
			group = $2.to_i
			@entry.room = "D#{room}" if room.in?(['204', '205', '206', '207', '208'])
			@entry.group = group if group.in?(1..20)
		end
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
