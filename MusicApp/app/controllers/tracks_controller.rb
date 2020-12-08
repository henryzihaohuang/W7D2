class TracksController < ApplicationController

    def index 
        @tracks = Track.all
        render :index
    end

    def create
        @track = track.new(track_params)
        @track.save
        if @track.save 
            redirect_to tracks_url
        else
            flash[:errors] = @track.errors.full_messages
            render :new
        end
    end

    def edit
        @track = Track.find_by([params[:name])
        render :edit
    end

    def destroy
        @track = Track.find_by(params[:name])
        @track.destroy
        redirect_to tracks_url
    end

    def new
        @track = Track.new
        render :new
    end

    private

    def track_params
        params.require(:album).permit(:album_id, :title, :ord, :lyrics, :version)
    end
end
