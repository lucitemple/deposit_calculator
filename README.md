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

## Tradeoffs & Design Decisions

I tried to find the happy balance between "this is a small 2 hours challenge" and "hypothetical first increment towards production level app".

#### Prep/setup

- I used [excalidraw](https://excalidraw.com/#json=CaioI-I6CT9S-Q8NFlFFJ,WtH84xZO9_AUi1WWUARRig) to briefly plan out thoughts before starting to code.

- Reviewed the example calculator to understand how it worked, and get the expected final balances to use in tests

- Lost some time trouble shooting dev environment on my personal computer, which I don't usually use for coding. Installed the technologies, fixed my zsh paths, etc, to be as set up as possible before starting coding on this challenge.

- I didn't include prep, setup or writing the README within the 2hr limit (which I took to mean active coding time).

#### Term Deposit Formulas and Final Balance
As noted, there are different formulas that could be used, and in production it would be important to be as accurate as possible in matching the bank's financial offering. 

This decision (which formula matches the financial offering) felt a bit out of scope for this take home challenge, so I settled with finding a formula that appeared to get the same final balance as the example calculator. The online calculator rounds to nearest dollar, so I did the same for this exercise, though the trade off is that it is not as precise. 

I left some things out of scope for this step. E.g. I restricted inputs for simplest calculation.

Given more time:
- see if I could achieve same or better results with a common formula
- refactor this part of the code, remove duplication
- handle greater variety of inputs (e.g. 5 years, 6 months)
- I would not have rounded to nearest dollar at the services/calculator level but rather in the controller for display purposes only.

#### Ruby
Ruby is what I've primarily used most recently for work. It wasn't a straight forward decision, because I have more experience with Javascript, so I was a little torn about which way to go. In the end I decided Ruby is a more valuable skill to show for this role.

#### Test driven

TDD ensures requirements are met.

I cut some corners, without all the bells and whistles of pre-commit hooks and CI/CD, which would be in place for a production environment.

While I wrote coverage for the happy path, I only wrote a few examples for the unhappy path as I ran out of time to test for all edge cases. 

There is currently some double up in the feature spec and services spec for the calculator, because it was first step. If I'd had more time, such as to add a view, then the feature spec would have been modified to fill in a form on the browser etc (in which case they would have been significantly different).

#### Rails
While not necessary for this step, conceptualised of it as a full app rather than a small contained program, though there was not time to deliver on the whole vision. This is more similar to what I have been working with in a production environment. 

#### Validations & Errors

ActiveModel to ensure clean data, regardless of source, and provide useful invalidation messages. Raise an error when the data is invalid, however I anticipated that catching the error would be done in a next step (e.g. in a controller or api that makes use of the Calculator).

#### Accessing the Calculator via Rails console

I weighed up whether to create a script that ran from the command line, or build a browser view to take the inputs, or, as I chose in the end, access the calculator via rails console. I'm not sure I made the right call on this. 

I had hoped I'd have enough time to throw on a basic view, which would have been my preffered solution and closer to what I was trying to achieve, however I ran out of time, so access via rails console is the fall back.

Within this decision is the greater question: go deep or broad? A simple ruby program would have allowed time focused on the most accurate calculator that runs from the command line; aspiration towards a fullstack app spreads one a bit thinner at the expense of a scoped down calculator and unfulfilled vision. 