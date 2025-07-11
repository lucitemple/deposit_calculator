class Calculator
  def self.calculate(initial_deposit, interest_rate, term, period)
    normalised_rate = interest_rate/100
    monthly_rate = 1 + (normalised_rate/12)

    if period == "monthly"
      power = 12 * term
      formulated = monthly_rate ** power
      (initial_deposit * formulated).round()
    end
  end
end
