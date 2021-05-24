require 'minitest/autorun'
require 'pp'
require_relative '../lib/drizzt/graph/graph'


class TestBaseAlgo < MiniTest::Unit::TestCase
  def setup
    @pf = PathFindingGraph.new
  end

  def test_basic_flat_table
    @pf.load_flat_table(
         [[1, 2], [2, 3], [1, 3], [3, 4]]
    )
    result = @pf.find_path(1, 4)
    assert_equal [1, 3, 4], result.path
  end

  def test_basic_weighted_table
    @pf.load_weighted_table(
      [[1, 2, 1], [2, 3, 1], [1, 3, 5], [3, 4, 1]]
    )
    result = @pf.find_path(1, 4)
    assert_equal [1, 2, 3, 4], result.path
  end


  def test_cycling_graph
    @pf.load_flat_table(
      [[1, 2], [2, 1]]
    )
    result = @pf.find_path(1, 2)
    assert_equal [1, 2], result.path
  end

  def test_dest_source_equal
    @pf.load_flat_table(
      [[1, 2]]
    )
    result = @pf.find_path(1, 1)
    assert_equal [1], result.path
  end

  def test_empty_graph
    @pf.load_flat_table([])
    assert_raises StandardError do
      result = @pf.find_path(1, 2)
    end
  end

  # def test_that_it_will_not_blend
  #   refute_match /^no/i, @meme.will_it_blend?
  # end
  #
  # def test_that_will_be_skipped
  #   skip "test this later"
  # end
end