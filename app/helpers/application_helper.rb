module ApplicationHelper

	#function to return the full title of page 
	def full_title(page_title_in)
		base_title = "Case Tracker"

		if page_title_in.empty?
			base_title
		else
			"#{base_title} | #{page_title_in}"
		end
	end	

end
