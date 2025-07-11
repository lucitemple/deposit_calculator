require "rails_helper"

RSpec.describe "Calculator" do
  describe ".calculate" do
    it "returns the correct final balance for monthly vesting" do
      # pending "Implement the Calculator"
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

  describe ".validate_input!" do
    it "raises an error when invalid" do
       params = { initial_deposit: 10000, interest_rate: 1.10, term: 3, vesting: "invalid" }

      expect { Calculator.validate_input!(params) }.to raise_error(ArgumentError)
    end

    it "returns the validated input" do
    input =  Calculator.validate_input!(initial_deposit: 10000, interest_rate: 1.10, term: 3, vesting: "maturity")


      expect(input).to be_valid
      expect(input.initial_deposit).to eq(10000)
      expect(input.interest_rate).to eq(1.10)
      expect(input.term).to eq(3)
      expect(input.vesting).to eq("maturity")
    end
  end
end
