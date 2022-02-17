class CommentsController < ApplicationController
  def create
    anonymous_user = User.find_by(first_name: "Anonymous 👻")
    @comment = Comment.new((comment_params).merge(:user => anonymous_user))

    if @comment.save
      flash[:notice] = 'commmentaire enregistré !'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @comment.errors.messages.values.flatten.join(' ')
      redirect_back(fallback_location: root_path)
    end
  end


  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find params[:id]
    @comment.update(comment_params)
    flash[:notice] = 'commmentaire modifié !'
    redirect_to gossip_path(@comment.gossip.id)
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    flash[:notice] = 'commmentaire supprimé !'
    redirect_to gossip_path(@comment.gossip.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :gossip_id)
  end
end
