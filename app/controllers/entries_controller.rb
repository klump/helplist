class EntriesController < ApplicationController
  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.open.order("created_at ASC")
  end

  # GET /entries/new
  def new
    @entry = Entry.new

    if request_ip =~ /\A10\.(\d{1,3})\.(\d{1,3})\.\d{1,3}\Z/
      room = $1
      group = $2.to_i
      
      if ( ( room.in?(['204', '205', '206', '207', '208']) ) && ( group.in?(1..20) ) )
        @entry.room = "D#{room}"
        @entry.group = group
      end
    end
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)
    
    @entry.ip = request_ip
    @entry.closed_at = nil

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

    @entries = Entry.open.course(@filter).order("created_at ASC")
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = Entry.open.find(params[:id])

    if request_ip == @entry.ip
      @entry.close
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'Entry was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_url, alert: 'Permission denied.' }
        format.json { render json: { error: 'Permission denied.', status: :unprocessable_entity } }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:course, :name, :room, :group, :ip, :demonstration)
    end

    # try to get the room and group from the IP address
    def request_ip
      remote_ip = request.env["HTTP_X_FORWARDED_FOR"]
      remote_ip = request.env["HTTP_X_REAL_IP"] if remote_ip.nil?
      remote_ip = request.remote_ip if remote_ip.nil?

      return remote_ip
    end
end
