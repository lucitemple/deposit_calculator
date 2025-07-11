# Term Deposit Calculator

A simple term deposit calculator that calculates the return on term deposits similar to https://www.bendigobank.com.au/calculators/deposit-and-savings/

First iteration involves using the calculator through a rails console.

## Dependencies

 * Ruby 3.4.4
 * Node 14.15.1
 * Rspec
 * Rails 8

## How to run

1. Clone the project from github `git clone git@github.com:lucitemple/deposit_calculator.git`
2. Navigate into the project directory `cd deposit_calculator`
3. Install any dependencies and `bundle install`
4. Open a rails console `bin/rails c`
5. Pass four params to the Calculator's calculate method:
    - initial deposit as a whole number (e.g. 10000)
    - interest rate as a float (e.g. 1.1)
    - term of deposit as a whole number in years (e.g. 3)
    - string option for when the interest will be added (options: "monthly", "quarterly", "annually", "maturity")

    ```ruby
    Calculator.calculate(1000, 1.1, 3, "maturity")
    ``` 
6. It returns the amount to the nearest dollar.
7. If an invalid param is passed, it will throw an error and provide a useful message.

## Testing
To run all tests from the command line

```bash
bundle exec rspec
```

## Assumptions/Limitations

MVP towards building a term deposit calculator similar the one on the website,
 rounding to the nearest round number rather than high accuracy. Could easily be modified for higher accuracy if needed. 

- whole numbers for initial deposit and term (terms in full years)
- 356 days in a year (ignore leap year)
- each month as 1/12 of one year regardless of month length
- quarterly as 1/4 of one year
- interest is reinvested
- return rounded to the nearest whole number (same as online calculator)
- return as number, does not include $ symbol or punctuation

Formulas used for calculator:

<!-- - Daily: B = Principle(1+ rate/365) to power of 365*term -->
- Monthly: B = Principle(1+ rate/12) to power of 12*term
- Quarterly: B = Principle(1+ rate/4) to power of 4*term
- Annual: B = Principle(1+ rate) to power of term
- Maturity: B = Principle(1+ rate*term) 
