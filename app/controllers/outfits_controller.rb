class OutfitsController < ApplicationController
    def index
        @query = params[:query]
        if params[:query].present?
            sql_query = "name ILIKE :query 
            OR description ILIKE :query"
            @outfits = policy_scope(Outfit).where(sql_query, query: "%#{params[:query]}%")
        else
            @outfits = policy_scope(Outfit).order(created_at: :desc)
        end
    end

    def new
        @outfit = Outfit.new
        authorize(@outfit)
    end

    def show
        @outfit = Outfit.find(params[:id])
        authorize(@outfit)
        @reservation = Reservation.new
    end

    def create
        @outfit = Outfit.new(outfit_params)
        @outfit.user = current_user
        authorize(@outfit)
        
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
        params.require(:outfit).permit(:name, :description, :price, :image, :category, :user_id, photos: [])
    end
end
