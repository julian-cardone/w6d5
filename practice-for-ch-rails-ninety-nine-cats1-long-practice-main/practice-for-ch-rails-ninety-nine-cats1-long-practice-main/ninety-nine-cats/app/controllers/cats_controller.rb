class CatsController < ApplicationController

    def index 
        @cats = Cat.all 
        render :index
    end

    def show 
        @cat = Cat.find(params[:id])
        render :show
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            render :create
        else
            render @cat.errors.full_messages, status: 422
        end
    end

    def update 
        @cat = Cat.find_by(id: params[:id])
        if @cat.update(cat_params)
            render :update
        else 
            render @cat.errors.full_messages, status: 422
        end
        
    end
    private

    def cat_params 
        params.require(:cats).permit(:birth_date, :color, :name, :sex)
    end
end