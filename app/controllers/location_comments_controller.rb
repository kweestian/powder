class LocationCommentsController < ApplicationController
  
  before_filter :load_location
  # before_filter :restrict_access

	def new
  		@comment = @location.location_comments.build
	end

	def create
		@comment = @location.location_comments.build(review_params)

		if @comment.save
			redirect_to @location, notice: "Comment created!"
		else
			render :new
		end
	end

  protected 

  	def load_location
  		puts params
  		@location = Location.find(params["location_id"])
  	end

  	def review_params
  		params.require(:location_comment).permit(:comment, :vote)
  	end

end
