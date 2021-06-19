# frozen_string_literal: true

class CommentsController < ApplicationController
  # POST /comments or /comments.json
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice: 'Comment was successfully created.'
    else
      render @commentable_render
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content)
  end
end
