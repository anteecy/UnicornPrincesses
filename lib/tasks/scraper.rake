desc "Scraping data from web"
task :scrape_data  do
	

require 'nokogiri'
require 'mechanize'
require 'byebug'

=begin
	Scraping data from "the ohio state university"
=end 



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
	cls_ary = Array.new
	i = 0
	while i < j - 1
		cls_detail = arr[i].split " "
		 class_name = cls_detail[1]
		 class_num = cls_detail[2]
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
		cls = {
			:cls_name => class_name,
			:cls_num => class_num,
			:day => day,
			# :lecturer => lecturer,
			:time => time,
			# :location => location
		}
		cls_ary << cls
		# Course.create!(
		# 	course_number = class_name
		# 	section_number = class_num
		# 	start_time = time
		# 	days = day 
		# 	)
	end
	byebug
end
