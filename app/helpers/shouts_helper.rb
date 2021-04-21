module ShoutsHelper
  def avatar(user)
    email_digest = Digest::MD5.hexdigest(user.email)
    gravatar_url = "//www.gravatar.com/avatar/#{email_digest}?s=50&d=identicon"

    image_tag  gravatar_url
  end
end
