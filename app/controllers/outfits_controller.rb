class OutfitsController < ApplicationController
  def index
    # @outfits = Outfit.all
    @outfits = policy_scope(Outfit).order(created_at: :desc)
  end

  def show
    @outfit = Outfit.find(params[:id])
    @reservations = @outfit.reservations
    authorize @outfit
  end

  def new
    @outfit = Outfit.new
    authorize @outfit
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user
    authorize @outfit
    if @outfit.save
      redirect_to outfit_path(@outfit)
    else
      render "new"
    end
  end

  def list
    @outfits = Outfit.find(params[:user_id])
    authorize @outfits
  end

  def update
    @outfit = Outfit.find(params[:id])
    authorize @outfit
    @outfit.update(outfit_params)
    redirect_to outfit_path(@outfit)
  end

  def destroy
    @outfit = Outfit.find(params[id])
    authorize @outfit
    @outfit.destroy
    redirect_to outfit_path
  end

  private

  def outfit_params
    params.require(:outfit).permit(:name, :description, :price, :image, :category, :user_id, :photo)
  end
end
