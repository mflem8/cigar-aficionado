class ReviewsController < ApplicationController

    def index

    end

    def new
        @cigar = Cigar.find_by_id(params[:cigar_id])
        @review = @cigar.build_review
    end

end
