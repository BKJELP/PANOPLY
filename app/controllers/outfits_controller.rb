class OutfitsController < ApplicationController

    def index
        # @outfits = Outfit.all
        @outfits = policy_scope(Outfit).order(created_at: :desc)
    end

    def show
        @outfit = Outfit.find(params[:id])
    end

    def new
        @outfit = Outfit.new
    end

    def create
        @outfit = Outfit.new(outfit_params)
        if @outfit.save
            redirect_to outfit_path(@outfit)
        else
            render "new"
        end
    end

    def list
        @outfits = Outfit.find(params[:user_id])
    end

    def update
        @outfit = Outfit.find(params[:id])
        @outfit.update(outfit_params)
        redirect_to outfit_path(@outfit)
    end

    def destroy
        @outfit = Outfit.find(params[id])
        @outfit.destroy
        redirect_to outfit_path
    end

private

    def outfit_params
        params.require(:outfits).permit(:name, :photo, :description, :price, :image, :category, :user_id)
    end
end
