class AlbumsController < ApplicationController

    def create
        @album = Album.new(album_params)
        @album.save
        if @album.save 
            redirect_to album_url
        else
            flash[:errors] = @album.errors.full_messages
            render :new
        end
    end

    def edit
        @album = Album.find_by([params[:name])
        render :edit
    end

    def destroy
        @album = Album.find_by(params[:name])
        @album.destroy
        redirect_to album_url
    end

    def new
        @album = Album.new
        render :new
    end

    private

    def album_params
        params.require(:album).permit(:band_id, :title, :year, :version)
    end
end
