module Suture
  class ChoosesSurgeonTest < Minitest::Test
    def setup
      @subject = ChoosesSurgeon.new
    end

    def test_no_op
      plan = Value::Plan.new

      result = @subject.choose(plan)

      assert_kind_of Surgeon::NoOp, result
    end

    def test_development
      plan = Value::Plan.new(:record_calls => true)

      result = @subject.choose(plan)

      assert_kind_of Surgeon::Observer, result
    end
  end
end
