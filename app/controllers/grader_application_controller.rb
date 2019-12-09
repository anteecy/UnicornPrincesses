require 'byebug'
class GraderApplicationController < ApplicationController
	def application_params
		params.require(:applications).permit(:first_name, :last_name, :email, :courses, :status)
	end

	def index
		@application = GraderApplication.find(current_user.id)
		if @application
			render :edit
		else
			redirect_to 'new'
		end
	end
	def show_student_application
		@user = User.find(params[:id])
	end

	def list
		@applications = GraderApplication.all
        render :list
	end

	def show
		# byebug
		@application = GraderApplication.find(params[:id])
      render :show
	end

	def new
		@application = GraderApplication.new()
		#@owner = User.find(params[:id])
	end

	def create
		@application = GraderApplication.create(application_params)

        if @application.save!
			redirect_to :action => 'show', :id => @application
		else
			render :action => 'edit'
		end

	end

	def edit
		@application = GraderApplication.find(params[:id])
	end

	def update
		@application = GraderApplication.find(params[:id])

		if @application.update_attributes(application_params)
			redirect_to :action => 'show', :id => @application
		else
			render :action => 'edit'
		end

	end

	def delete
		GraderApplication.find(params[:id]).destroy
		redirect_to :action => 'list'
	end

    def accept
			@application = GraderApplication.find(params[:subid])
        # @application = Application.where(:id => :subid).first
        @application.status = 1
        @application.save!
        # @application
        #params[:status] = 1
		# if @application.update_attributes(application_params)
		# 	redirect_to :action => 'list'
		# else
		# 	render 'list'
		# end
    end

    def reject
			@application = GraderApplication.find(params[:subid])
        # @application = Application.where(:id => :subid).first
        @application.status = 2
        @application.save
  #       @application = Application.find(params[:id])
  #       @application.status = 2
		# if @application.update_attrubutes(application_params)
		# 	redirect_to :action => 'list'
		# else
		# 	render 'list'
		# end
    end


end
