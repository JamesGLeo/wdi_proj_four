class ScheduleParser
  TIME_FRAGMENT = /((?:\d{1,2}(?::30)?(?:AM|PM)?|MIDNIGHT|NOON))/
  TIME_SEPARATOR = /\s?(?:-|TO)\s?/
  TIMES_EXP = /#{TIME_FRAGMENT}#{TIME_SEPARATOR}#{TIME_FRAGMENT}/
  DAYS_EXP_F1 =  /(EXCEPT)+|(MONDAY|\bMON\b)+|(TUESDAY|\bTUE\b)+|(WEDNESDAY|\bWED\b)/
  DAYS_EXP_F2 = /+|(THURSDAY|\bTHURS\b)+|(FRIDAY|\bFRI\b)+|(SATURDAY|\bSAT\b)+|(SUNDAY|\bSUN\b)+|(THRU))/
  DAYS_EXP = /#{DAYS_EXP_F1}#{DAYS_EXP_F2}/

  def call(string_to_parse)
    times = extract_times(string_to_parse)
    # MAYBE IN THE FUTURE:
    # dates = extract_dates(string_to_parse)
    # all_exceptions = combine(dates, times)

  end


  def extract_times(string_to_parse)
    times = string_to_parse.scan TIMES_EXP
    times.map! { |time| change_words_into_times(time) }
    times.map! { |time| format_times(time) }
  end

  def extract_dates(string_to_parse)
    dates = string_to_parse.scan DATES_EXP
  end

  def change_words_into_times(times)
    times.map do |time|
      case time
        when "MIDNIGHT" then "12AM"
        when "NOON" then "12PM"
        else time
      end
    end
  end

  def format_times(times)
    return times if times == ['', '']
    desired_endings = ["AM", "PM"]
    start_time_ending = times[0][-2..-1]
    end_time_ending = times[1][-2..-1]
    return times if desired_endings.include?(start_time_ending) && desired_endings.include?(end_time_ending)
    start_time = times[0]
    end_time = times[1]
    start_time << end_time_ending
    [start_time, end_time]
  end
end
