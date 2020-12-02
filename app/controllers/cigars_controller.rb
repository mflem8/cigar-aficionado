class CigarsController < ApplicationController

    def index
        @cigars = Cigar.all
    end
    
    def new
        @cigar = Cigar.new
        @cigar.build_brand
    end

    def create
        @cigar = Cigar.new(cigar_params)
        @cigar.user_id = session[:user_id]
        if @cigar.save!
            redirect_to cigar_path(@cigar)
        else
            render :new
        end
    end

    private
    
    def cigar_params
        params.require(:cigar).permit(:style, :description, :brand_id, brand_attributes: [:name])
    end
end
