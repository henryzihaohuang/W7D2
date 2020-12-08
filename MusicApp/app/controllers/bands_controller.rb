class BandsController < ApplicationController

    def index 
        @bands = Band.all
        render :index
    end

    def create
        @band = Band.new(band_params)
        @band.save
        if @band.save 
            redirect_to band_url
        else
            flash[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def edit
        @band = Band.find_by(params[:name])
        render :edit
    end

    def destroy
        @band = Band.find_by(params[:name])
        @band.destroy
        redirect_to band_url
    end

    def new
        @band = Band.new
        render :new
    end

    private

    def band_params
        params.require(:band).permit(:name)
    end
end
