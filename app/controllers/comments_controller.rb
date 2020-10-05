class CommentsController < ApplicationController
	 before_action :require_logged_in

	 def create
		@comment = current_user.comments.build(comment_params)
		@comment.micropost_id = params[:micropost_id]
		if @comment.save
			flash[:success] = "コメントしました"
			redirect_to @comment.micropost
		end	
	 end

	 private

	 def comment_params
		 params.require(:comment).permit(:comment_content)  
	 end

end
