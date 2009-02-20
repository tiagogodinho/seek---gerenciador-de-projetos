# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def gravatar_url_for(email, options = {})
    url_for({
      :gravatar_id => Digest::MD5.hexdigest(email),
      :host => 'secure.gravatar.com',
      :protocol => 'https://',
      :only_path => false,
      :controller => 'avatar.php'}.merge(options))
  end
end
