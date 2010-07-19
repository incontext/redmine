# WeeklyCalendar by Dan McGrady 2009
module WeeklyCalendar

  def weekly_calendar(objects, *args)
    #view helper to build the weekly calendar
    options = args.last.is_a?(Hash) ? args.pop : {}
    date = options[:date] || Time.now
    start_date = Date.new(date.year, date.month, date.day)
    end_date = Date.new(date.year, date.month, date.day) + 6

    param = options[:param].merge(:start_date => start_date)
    concat('<p>')
    param_str = param.keys.map {|k| "#{k}=#{param[k]}"}.join('&')
    if options[:include_24_hours] == true
      concat("<a href='?#{param_str}&business_hours=true'>Business Hours</a> | <a href='?#{param_str}&business_hours=false'>24-Hours</a>")
    end

    weekly_links(options)
    concat('</p>')

    concat(tag("div", :id => "week"))

      yield WeeklyCalendar::Builder.new(objects || [], self, options, start_date, end_date)

    concat("</div>")
  end

  def weekly_links(options)
    #view helper to insert the next and previous week links
    date = options[:date] || Time.now
    start_date = Date.new(date.year, date.month, date.day)
    end_date = Date.new(date.year, date.month, date.day) + 7
    concat(" | ")
    param_str = options[:param].keys.map {|k| "#{k}=#{options[:param][k]}"}.join('&')
    concat("<a href='?#{param_str}&start_date=#{start_date - 7}'>« Previous Week</a> ")
    concat("#{start_date.strftime("%B %d -")} #{end_date.strftime("%B %d")} #{start_date.year}")
    concat(" <a href='?#{param_str}&start_date=#{start_date + 7}'>Next Week »</a>")
  end

end
