class RoomsController < ApplicationController

  	before_filter :config_opentok,:except => [:index]

	def index
		@rooms = Room.all#where(:public => true)#.order(“created_at DESC”)

	end

	def new
		@room = Room.create(params[:room])
	end

	def create
	

		session = @opentok.create_session 
		params[:room][:sessionId] = session.session_id

		@room = Room.create(room_params)
	
		respond_to do |format|
			if @room.save
				format.html { redirect_to('/party/'+@room.id.to_s) }
			else
				format.html { render action: 'new' }
			end
			@room.save!
		end
	end

	def party
		@room = Room.find(params[:id])

		@tok_token = @opentok.generate_token(@room.sessionId)
	end

	private
		def config_opentok
		if @opentok.nil?
			@opentok = OpenTok::OpenTok.new 45139402, '46ab9b10b057ebb4f4838c60b2c248c05968719d'
		end
	end
	
	def room_params
    	params.require(:room).permit(:sessionId, :public, :name)
  end
end


