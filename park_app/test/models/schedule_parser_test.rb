require 'test_helper'

class ScheduleParserTest < ActiveSupport::TestCase
  def setup
    @parser = ScheduleParser.new
  end

  def test_cannot_park_before_sunrise
    input = "NO PARKING MIDNIGHT-6AM INCLUDING SUNDAY"
    expected = [["12AM", "6AM"]]
    actual = @parser.call(input)
    assert_equal expected, actual
    # output = {
    #   'monday' => [['12AM', '6AM']],
    # }
  end

  def test_no_parking_saturday_afternoon
    input = "NO PARKING 1PM-MIDNIGHT (SINGLE ARROW)"
    expected = [["1PM", "12AM"]]
    actual = @parser.call(input)
    assert_equal expected, actual
  end

  def test_no_parking_anytime
    input = "NO PARKING ANYTIME"
    expected = []
    actual = @parser.call(input)
    assert_equal expected, actual
  end

  def test_adding_meridian_split
    input = "NO PARKING 7-10AM "
    expected = [["7AM","10AM"]]
    actual = @parser.call(input)
    assert_equal expected, actual
  end

  def test_two_time_pairs
    input = "NO PARKING 7-9AM 4-7PM"
    expected = [["7AM", "9AM"],["4PM", "7PM"]]
    actual = @parser.call(input)
    assert_equal expected, actual
  end


end
