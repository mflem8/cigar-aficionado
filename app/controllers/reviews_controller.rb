class ReviewsController < ApplicationController

    def index
        if @cigar = Cigar.find_by_id(params[:cigar_id])
            @reviews = @cigar.reviews
        else
            @reviews = Review.all
        end
    end

    def new
        if @cigar = Cigar.find_by_id(params[:cigar_id])
            @review = @cigar.reviews.build
        else
            @review = Review.new 
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    private 
    
    def review_params
        params.require(:review).permit(:cigar_id, :summary, :matches, :title)
    end

end
