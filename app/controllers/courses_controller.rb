class CoursesController < ApplicationController
    def course_params
		params.require(:courses).permit(:course_number, :section_number, :start_time, :end_time, :days, :is_offered)
	end

    def index
        @courses = Course.all
        render 'index', locals: {courses: @courses}
    end

	def list
		@courses = Course.all
	end

	def list_active
		@courses = Course.where("is_offered = 'true")
	end

	def show
		@course = Course.find(params[:id])
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)

		if @course.save
			redirect_to :action => 'list'
		else
			render :action => 'edit'
		end

	end

	def edit
		@course = Course.new
	end

	def update
		@course = Course.find(params[:id])

		if @course.update_attrubutes(course_params)
			redirect_to :action => 'show', :id => @course
		else
			render :action => 'edit'
		end

	end

	def delete
		Course.find(params[:id]).destroy
		redirect_to :action => 'list'
	end

	def scrape
		if(Course.all.count < 1)
			require 'nokogiri'
			require 'mechanize'
			agent = Mechanize.new #get mechanize agent
			unparsed_page = agent.get "https://www.asc.ohio-state.edu/barrett.3/schedule/CSE/1202.txt"
			parsed_page = Nokogiri::HTML(unparsed_page.body,'UTF-8')
			classes = parsed_page.text.split("\n")
			# classes = Array.new
			# i = 0
			# File.open("1178.txt").each do  |line|
			# 	classes[i] = line
			# 	i = i + 1
			# end

			 i = 0
			 j = 0
			 arr = Array.new
			 string = String.new
			while (1)
				if classes[i].include? "INDependent"
					break;
				end
				if classes[i] != ""
					string << classes[i]
				else
					arr[j] = string
					string = ""
					j = j + 1
				end
				i = i + 1
			end

			arr.delete_at(0)
			i = 1
			while i < j - 1
				cls_detail = arr[i].split " "
				 class_name = cls_detail[1]
				 if cls_detail[2] =~ /\d/
				 	class_num = cls_detail[2]
				 else
				 	class_num = cls_detail[3]
				 end
				 # lecturer = String.new
				 day = String.new
				 time = String.new
				 # location = String.new
				 k = 0
				 cls_detail.each do |variable|
				 	if (variable.include? 'M' or variable.include? 'T' or variable.include? 'W' or variable.include? 'R' or variable.include? 'F') and variable.length < 2
				 		day << variable
				 	# elsif variable.include? '.';
				 	# 	lecturer = variable
				 	elsif variable.include? "0P" or variable.include? '0A' or variable.include? '5A' or variable.include? '5P'
				 		time << " " << variable
				 		# location << " " << cls_detail[k + 1]
				 	end
				 	k = k + 1
				 end
				i = i + 1
				@course = Course.new(
					:course_number => class_name,
					:section_number => class_num,
					:days => day,
					# :lecturer => lecturer,
					:start_time => time,
					# :location => location
				)
				@course.save
			end
		end
		@courses = Course.all
	end
end
