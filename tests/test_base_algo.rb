require 'minitest/autorun'
require 'pp'
require_relative '../lib/drizzt/graph/graph'


class TestBaseAlgo < MiniTest::Unit::TestCase
  def setup
    @pf = DrizztGraph.new
  end

  def test_basic_flat_table_yaml_load
    @pf.load_flat_table('tests/test.yaml')
    result = @pf.find_path(:foo, :foobar)
    assert_equal [:foo, :foobar], result.path
  end

  def test_basic_flat_table
    @pf.input_flat_table(
        [[1, 2], [2, 3], [1, 3], [3, 4]]
    )
    result = @pf.find_path(1, 4)
    assert_equal [1, 3, 4], result.path
  end

  def test_basic_weighted_table
    @pf.input_weighted_table(
      [[1, 2, 1], [2, 3, 1], [1, 3, 5], [3, 4, 1]]
    )
    result = @pf.find_path(1, 4)
    assert_equal [1, 2, 3, 4], result.path
  end

  def test_weighting_node
    @pf.input_flat_table(
        [[1, 2], [2, 3], [1, 3], [3, 4],
        [1, 5], [5, 6], [6, 7], [7, 4]]
    )
    @pf.weight_node(3, 10)
    result = @pf.find_path(1, 4)
    assert_equal [1, 5, 6, 7, 4], result.path
  end

  def test_cycling_graph
    @pf.input_flat_table(
      [[1, 2], [2, 1]]
    )
    result = @pf.find_path(1, 2)
    assert_equal [1, 2], result.path
  end

  def test_dest_source_equal
    @pf.input_flat_table(
      [[1, 2]]
    )
    result = @pf.find_path(1, 1)
    assert_equal [1], result.path
  end

  def test_empty_graph
    @pf.input_flat_table([])
    assert_raises StandardError do
      result = @pf.find_path(1, 2)
    end
  end


end