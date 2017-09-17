module UsersHelper
	def avatar_for(user, options = { size: 80} )
		size = options[:size]
		if user.image?
			image_tag user.image.url(:thumb), width: size, class: 'avatar_img'
		else
			image_tag "image1.jpg", width: size, class: 'avatar_img'
		end
	end
end