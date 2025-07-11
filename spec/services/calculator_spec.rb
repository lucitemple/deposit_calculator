require "rails_helper"

RSpec.describe "Calculator" do
  describe ".calculate" do
    it "returns the correct final balance for monthly vesting" do
      # pending "Implement the Calculator"
      final_balance = Calculator.calculate(10000, 1.10, 3, "monthly")

      expect(final_balance).to eq(10335)
    end

    it "returns the correct final balance for quarterly vesting" do
      pending "Implement the Calculator"
      final_balance = Calculator.calculate(10000, 1.10, 3, "quarterly")

      expect(final_balance).to eq(10335)
    end
    it "returns the correct final balance for annual vesting" do
      pending "Implement the Calculator"
      final_balance = Calculator.calculate(10000, 1.10, 3, "annually")

      expect(final_balance).to eq(10334)
    end
    it "returns the correct final balance for vesting at maturity" do
      pending "Implement the Calculator"
      final_balance = Calculator.calculate(10000, 1.10, 3, "maturity")

      expect(final_balance).to eq(10330)
    end
  end
end
