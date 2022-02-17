class GossipsController < ApplicationController


  def index
    @gossips = Gossip.order('created_at DESC')
  end


  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
  end


  def new
    @gossip = Gossip.new
  end


  def create
    anonymous_user = User.find_by(first_name: "Anonymous 👻")
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: anonymous_user)

    if @gossip.save
      flash[:notice] = 'Potin enregistré !'
      redirect_to root_path
    else
      flash.now[:alert] = @gossip.errors.messages.values.flatten.join(' ')
      render :new
    end

  end


  def edit
    @gossip = Gossip.find(params[:id])
  end


  def update
    @gossip = Gossip.find(params[:id])

    if @gossip.update(title:params[:title], content:params[:content])
      flash[:notice] = 'Potin modifié !'
      redirect_to @gossip
    else
      flash.now[:alert] = @gossip.errors.messages.values.flatten.join(' ')
      render :edit
    end

  end


  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:notice] = 'Potin supprimé !'
    redirect_to root_path
  end


end
