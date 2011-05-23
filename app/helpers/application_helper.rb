module ApplicationHelper
  def flash_messages(params = nil)
    params ||= flash
    html = '<div class="flash">'
    params.each do |type, message|
      html += %{<div class="message #{type.to_s}"><p>#{message}</p></div>}
    end
    html += '</div>'
    html.html_safe
  end

  def news_message(event)
    list = event.kind == 'watch' ? 'watched' : 'wish'
    link_to(event.user.name, event.user) + " has added " + link_to(event.movie.title, event.movie) + " to #{list} list"
  end
end
