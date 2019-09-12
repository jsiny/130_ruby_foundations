require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(1000)
    @transaction = Transaction.new(50)
  end

  def test_accept_money
    @transaction.amount_paid = 50
    @cash_register.accept_money(@transaction)
    assert_equal(1050, @cash_register.total_money)
  end

  def test_change
    @transaction.amount_paid = 200
    assert_equal(150, @cash_register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $50.\n") do
      @cash_register.give_receipt(@transaction)
    end
  end
end

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(50)
  end

  def test_prompt_for_payment
    input = StringIO.new("100\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(100, @transaction.amount_paid)
  end
end
