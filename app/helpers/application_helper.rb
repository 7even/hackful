module ApplicationHelper	
	def comment_count(object)
		count = object.comments.count
		object.comments.each do |comment|
			count += comment_count(comment)
		end
		count
	end
	
	def markdown(text, *options)
    require 'moredown'

    text = sanitize(text) unless text.html_safe? || options.delete(:safe)
    Moredown.text_to_html(text).gsub(/(?<!\w)(@(\w+))/, '<a href="http://twitter.com/\2">\1</a>').html_safe
	end
end
