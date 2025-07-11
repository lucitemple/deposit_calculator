class Calculator
  def self.calculate(initial_deposit, interest_rate, term, period)
    validate_input = validate_input!({ initial_deposit: initial_deposit, interest_rate: interest_rate, term: term, vesting: period })

    normalised_rate = interest_rate/100

    if period == "monthly"
      monthly_rate = 1 + (normalised_rate/12)
      power = 12 * term
      formulated = monthly_rate ** power
      (initial_deposit * formulated).round()
    elsif period == "quarterly"
      quarterly_rate = 1 + (normalised_rate/4)
      power = 4 * term
      formulated = quarterly_rate ** power
      (initial_deposit * formulated).round()
    elsif period == "annually"
      annually_rate = 1 + normalised_rate
      formulated = annually_rate ** term
      (initial_deposit * formulated).round()
    elsif period == "maturity"
      formulated = 1 + (normalised_rate * term)
      (initial_deposit * formulated).round()
    end
  end

  private
  def self.validate_input!(params)
     input = CalculatorInput.new(params)

     unless input.valid?
      raise ArgumentError, input.errors.full_messages.join(", ")
     end
    input
  end
end
