require 'minitest/autorun'
require 'proc_eval'

class ProcEvalClassTest < Minitest::Test
  using ProcEval

  def test_example1
    lambda = ->(a) { a }
    value = lambda.evaluate('hello', 'world')
    assert_equal value, 'hello'
  end

  def test_example2
    lambda = ->(a, b, c, d, e, f) { [a, b, c, d, e, f] }
    value = lambda.evaluate(1, 2, 3, 4)
    assert_equal value, [1, 2, 3, 4, nil, nil]
  end

  def test_example3
    lambda = ->(a) { a }
    value = lambda.evaluate('Im a proc!!!', 'world')
    assert_equal value, 'Im a proc!!!'
  end

  def test_example4
    lambda = 'im a value!!!'
    value = lambda.evaluate('hello', 'world')
    assert_equal value, 'im a value!!!'
  end

end

module TestModule
  using ProcEval
  extend self

  def example1
    lambda = ->(a) { a }
    lambda.evaluate('hello', 'world')
  end

  def example2
    lambda = ->(a, b, c, d, e, f) { [a, b, c, d, e, f] }
    lambda.evaluate(1, 2, 3, 4)
  end

  def example3
    lambda = ->(a) { a }
    lambda.evaluate('Im a proc!!!', 'world')
  end

  def example4
    lambda = 'im a value!!!'
    lambda.evaluate('hello', 'world')
  end
end

class ProcEvalModuleTest < Minitest::Test
  def test_example1
    value = TestModule.example1
    assert_equal value, 'hello'
  end

  def test_example2
    value = TestModule.example2
    assert_equal value, [1, 2, 3, 4, nil, nil]
  end

  def test_example3
    value = TestModule.example3
    assert_equal value, 'Im a proc!!!'
  end

  def test_example4
    value = TestModule.example4
    assert_equal value, 'im a value!!!'
  end

end
