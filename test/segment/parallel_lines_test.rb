require 'test/unit'
require 'geometry'

class ParallelLinesTest < Test::Unit::TestCase
  include Geometry

  def test_get_parallel_lines_for_horizontal_line
    segment = Segment.new_by_arrays([1, 1], [5, 1])

    parallel_lines = segment.parallel_lines(2)

    assert array_includes_segment parallel_lines, Segment.new_by_arrays([1,3], [5,3])
    assert array_includes_segment parallel_lines, Segment.new_by_arrays([1,-1], [5,-1])
  end

  def test_get_parallel_lines_for_vertical_line
    segment = Segment.new_by_arrays([1, 1], [1, 5])

    parallel_lines = segment.parallel_lines(2)

    assert array_includes_segment parallel_lines, Segment.new_by_arrays([3,1], [3,5])
    assert array_includes_segment parallel_lines, Segment.new_by_arrays([-1,1], [-1,5])
  end

  def test_get_parallel_lines_for_diagonal_line
    segment = Segment.new_by_arrays([1, 1], [4, 5])

    parallel_lines = segment.parallel_lines(2)

    puts parallel_lines.inspect
    assert array_includes_segment parallel_lines, Segment.new_by_arrays([-0.6000000000000001,2.2], [2.4,6.2])
    assert array_includes_segment parallel_lines, Segment.new_by_arrays([2.6,-0.19999999999999996], [5.6,3.8])
  end

  def array_includes_segment(array, segment)
    array.each do |s|
      return true if segments_equal(s, segment)
    end
    false
  end

  def segments_equal(s1, s2)
    (s1.point1 == s2.point1 && s1.point2 == s2.point2) || (s1.point1 == s2.point2 && s1.point2 == s2.point1)
  end
end