require "rails_helper"

RSpec.describe "Calculate term deposit" do
  context "a user provides valid params" do
    it "returns the correct final balance for monthly vesting" do
      final_balance = Calculator.calculate(10000, 1.10, 3, "monthly")

      expect(final_balance).to eq(10335)
    end

    it "returns the correct final balance for quarterly vesting" do
      final_balance = Calculator.calculate(10000, 1.10, 3, "quarterly")

      expect(final_balance).to eq(10335)
    end
    it "returns the correct final balance for annual vesting" do
      final_balance = Calculator.calculate(10000, 1.10, 3, "annually")

      expect(final_balance).to eq(10334)
    end
    it "returns the correct final balance for vesting at maturity" do
      final_balance = Calculator.calculate(10000, 1.10, 3, "maturity")

      expect(final_balance).to eq(10330)
    end
  end

  context "a user provides invalid params" do
    it "returns a useful error message" do
      expect { Calculator.calculate(10000, 1.10, 3, "invalid") }.to raise_error(/error/)
    end
  end
end
