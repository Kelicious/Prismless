module UsersHelper
  def gravatar_for(user)
    gravatar_id = gravatar_id_for(user)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def gravatar_id_for(user)
    Digest::MD5::hexdigest(user.email.downcase)
  end
end
