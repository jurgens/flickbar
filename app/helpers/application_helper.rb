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

  def relative_date(date)
    date = Date.parse(date, true) unless date.kind_of?(Date)
    days = (date - Date.today).to_i

    return 'today'     if days == 0
    return 'tomorrow'  if days == 1
    return 'yesterday' if days == -1

    return "in #{days} days"      if days.abs < 60 and days > 0
    return "#{days.abs} days ago" if days.abs < 60 and days < 0

    return date.strftime('%A, %B %e') if days.abs < 182
    date.strftime('%A, %B %e, %Y')
  end
end
