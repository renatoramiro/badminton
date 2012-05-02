module ApplicationHelper

	def show_notice(notice)
		if notice
			content_tag :div, :class => "span4" do
				html = ""
				html += content_tag :div, h(notice), :class => "alert alert-success"
				html.html_safe
			end
		end
	end

	def error_messages_for(resource)
    render partial: "shared/error_messages_for", 
					 locals: { resource: resource }
  end

end
