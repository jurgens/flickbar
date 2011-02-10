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

end
