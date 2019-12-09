class RecommandationformController < ApplicationController

def recommandation_params
		params.require(:recommandations).permit(:email, :recommanded, :context)
	end

	def list
		@recommandations = Recommandation.all
        render :list
	end

	def show
    @application = GraderApplication.find(params[:id])
	 	 @recommandation = Recommandation.find(params[:id])
      	 render :show
	end

	def new
		@recommandation = Recommandation.new()
		#owner = User.find(params[:id])
	end

	def create
		@recommandation = Recommandation.create(recommandation_params)

        if @recommandation.save! 
			redirect_to :action => 'show', :id => @recommandation
		else
			render :action => 'edit'
		end

	end

	def edit
		@recommandation = Recommandation.new
		@owner = User.find(params[id])
	end

	def update
		@recommandation = Recommandation.find(params[:id])

		if @recommandation.update_attrubutes(recommandation_params)
			redirect_to :action => 'show', :id => @recommandation
		else
			render :action => 'edit'
		end

	end

	def delete
		Recommandation.find(params[:id]).destroy
		redirect_to :action => 'list'
	end

end
