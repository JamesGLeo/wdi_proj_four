require 'test_helper'

class ScheduleParserTest < ActiveSupport::TestCase
  def setup
    @parser = ScheduleParser.new
  end

  def test__times_cannot_park_before_sunup
    input = "NO PARKING MIDNIGHT-6AM INCLUDING SUNDAY"
    expected = [["12AM", "6AM"]]
    actual = @parser.extract_times(input)
    assert_equal expected, actual
  end

  def test_times_no_parking_sat_noon
    input = "NO PARKING 1PM-MIDNIGHT (SINGLE ARROW)"
    expected = [["1PM", "12AM"]]
    actual = @parser.extract_times(input)
    assert_equal expected, actual
  end

  def test_times_no_parking_anytime
    input = "NO PARKING ANYTIME"
    expected = ["12AM", "11:59PM"]
    actual = @parser.extract_times(input)
    assert_equal expected, actual
  end

  def test_times_adding_meridian_split
    input = "NO PARKING 7-10AM "
    expected = [["7AM","10AM"]]
    actual = @parser.extract_times(input)
    assert_equal expected, actual
  end

  def test_times_two_time_pairs
    input = "NO PARKING 7-9AM 4-7PM"
    expected = [["7AM", "9AM"],["4PM", "7PM"]]
    actual = @parser.extract_times(input)
    assert_equal expected, actual
  end

  def test_times_using_to_as_seperator
    input = "NO PARKING (SANITATION BROOM SYMBOL) 11AM TO 12:30PM MON & THURS"
    expected = [["11AM", "12:30PM"]]
    actual = @parser.extract_times(input)
    assert_equal expected, actual
  end

  def test_dates_cannot_park_before_sunup
    input = "NO PARKING MIDNIGHT-6AM INCLUDING SUNDAY"
    expected = ["INCLUDING", "SUNDAY"]
    actual = @parser.extract_dates(input)
    assert_equal expected, actual
  end

  def test_dates_no_parking_sunday_and_holidays
    input = "NO PARKING SUNDAY & HOLIDAYS (SINGLE ARROW)"
    expected = ["SUNDAY"]
    actual = @parser.extract_dates(input)
    assert_equal expected, actual
  end

  def test_dates_no_parking_sat_midnight
    input = "NO PARKING 1PM-MIDNIGHT SATURDAY (SINGLE ARROW)"
    expected = ["SATURDAY"]
    actual = @parser.extract_dates(input)
    assert_equal expected, actual
  end

  def test_dates_no_parking_anytime
    input = "NO PARKING ANYTIME MAY 15 - SEPT 30"
    expected = ["SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY"]
    actual = @parser.call(input)
    assert_equal expected,actual
  end



  def test_td_cannot_park_bf_sunup
    input = "NO PARKING MIDNIGHT-6AM INCLUDING SUNDAY"
    expected = {
      :SUNDAY =>  [["12AM", "6AM"]],
      :MONDAY =>  [["12AM", "6AM"]],
      :TUESDAY => [["12AM", "6AM"]] ,
      :WEDNESDAY =>  [["12AM", "6AM"]],
      :THURSDAY => [["12AM", "6AM"]],
      :FRIDAY => [["12AM", "6AM"]],
      :SATURDAY => [["12AM", "6AM"]]
    }
    actual = @parser.call(input)
    assert_equal expected, actual

  end



end
