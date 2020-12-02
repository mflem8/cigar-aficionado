class CigarsController < ApplicationController

    def new
        @cigar = Cigar.new
        @cigar.build_brand
    end

    private
    
    def cigar_params
        params.require(:cigar).permit(:style, :description, :brand_id, brand_attributes: [:name])
    end
end
