class CommentsController < ApplicationController
  inherit_resources
  belongs_to :movie
  respond_to :js

  def create
    @comment = parent.comments.build params[:comment]
    @comment.user = current_user

    create!
  end

protected

  def begin_of_association_chain
    current_user
  end
end
