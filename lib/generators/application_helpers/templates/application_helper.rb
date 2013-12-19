module ApplicationHelper
  def app_name
    "<%= app_name %>"
  end

  # convenience class for icons
  def link_with_icon(name, object, options = {})
    contents = []
    contents << "<a href='#{object}' data-toggle='tooltip' title='#{options[:title]}'>"
    contents << "<i class='icon-#{options[:icon]}'></i>"
    contents << "</a>"
    contents.join.html_safe
  end

  def title(page_title, show_title = true)
    content_for(:title) { h(page_title.to_s)}
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def current_resource_url
    if user_signed_in?
      return user_path(current_user)
    else
      return customer_path(current_customer)
    end
  end

  def photable_delete_url(photo)
    photable_type = photo.photable_type
    photable_name = photable_type.dasherize
  end

	# Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = app_name
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

  # makes a _id column name into a class name, i.e. "roaster_id" becomes "Roaster"
  def classify_and_remove_id(name)
    name.to_s.classify[0...-2]          # [0...-2] removes the last 2 letters
                                        # which we hope are I and d!
  end

  def join_and_underscore(name)
    name = name.downcase
    name.gsub(" ", "_")
  end

  # Returns the Gravatar (http://gravatar.com/) for the given user.
	def gravatar_for(email, options = { size: 50 })
		gravatar_id = Digest::MD5::hexdigest(email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
		image_tag(gravatar_url, alt: email, class: "gravatar")
	end
end
