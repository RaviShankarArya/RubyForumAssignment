class CommentsController < ApplicationController
	before_action :find_post
	before_action :find_comment, :only => [:edit, :update, :destroy]

	def create
		if @post.present?
			@comment = @post.comments.build(comment_params)
			@comment.user_id = current_user.id
			if @comment.valid? && @comment.save!
			else
			end
		else
		end
		redirect_to forum_post_path(@post.forum,@post)
	end

	def edit
	end

	def update
		if @comment.present?
			@comment.update_attributes(comment_params)
		else
		end
		redirect_to forum_post_path(@post.forum,@post)
	end

	def destroy
		if @comment.present?
			@comment.update_attribute(:is_archived, true)
		end
		redirect_to forum_post_path(@post.forum,@post)
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

	def find_post
		@post  = Post.find_by_id(params[:post_id])
	end

	def find_comment
		@comment = @post.comments.find_by_id(params[:id])
	end
end