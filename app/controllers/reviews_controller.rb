class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def new
        @cigar = Cigar.find_by_id(params[:cigar_id])
        @review = @cigar.reviews.build
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show

    end

    private 
    
    def review_params
        params.require(:review).permit(:cigar_id, :summary, :matches, :title)
    end

end
