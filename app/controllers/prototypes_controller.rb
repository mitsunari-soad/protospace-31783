class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @user = User.all
    @prototypes = Prototype.all
    
  end

  def new
    @prototype = Prototype.new
  end

  def create
    prototype = Prototype.create(proto_params)
    if prototype.save
      redirect_to root_path  
    else
      render :new
    end
  end

  def show  
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless current_user.id == @prototype.user_id
      redirect_to action: :index
    end 
  end

  def update
    prototype = Prototype.find(params[:id])
    @prototype = prototype.update(proto_params)
    if Prototype.update(proto_params)
      redirect_to prototype_path
      else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    if prototype.destroy
      redirect_to root_path
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private
    def proto_params
      params.require(:prototype).permit(:title, :catch_copy, :image, :concept).merge(user_id: current_user.id)
    end
end

