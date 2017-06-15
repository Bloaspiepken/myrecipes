class CommentsController < ApplicationController
  before_action :require_user
  
  def create
    @wagon = Wagon.find(params[:wagon_id])
    @comment = @wagon.comments.build(comment_params)
    @comment.corsogroup = current_corsogroup
    if @comment.save
      ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)
      # flash[:success] = "Comment was created successfully"
      # redirect_to wagon_path(@wagon)
    else
      flash[:danger] = "Comment was not created"
      redirect_to :back
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:description)
  end
end