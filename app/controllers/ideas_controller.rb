class IdeasController < ApplicationController
    def index
      # Modelname .all here Idea is model
      @pagy, @ideas = pagy(Idea.order("created_at DESC"))
        @title="hello world"
      
      end
      def new
        @idea=Idea.new
      end
      def create
        @idea=Idea.create(permit_params)
        redirect_to root_path
      end

      def edit
        @idea=Idea.find (params[:id])
      
      end
      def update
        @idea = Idea.find(params[:id])
        if @idea.update(permit_params)
          redirect_to root_path
        else
          redirect_to edit_idea_path(params[:id])
        end
      end
      def destroy
        @idea = Idea.find(params[:id])
        @idea.destroy
        redirect_to root_path
      end

      private
      def permit_params
        params.require(:idea).permit(:title,:description)
      end
end
