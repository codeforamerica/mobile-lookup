# Mobile phone lookup script

## What
Read in a csv of data that includes phone numbers. Output the same csv with only the rows that Twilio says have mobile phone numbers.

## Why
We got big lists of phone numbers from Louisiana Medicaid. We needed to know which were mobile phones we could send text messages to.

## How
`ruby mobile_lookup.rb test.csv`
or you can name the column the phone number to look up is in. It is the fourth column by default.
`ruby mobile_lookup.rb test.csv 'Phone Number'`

### Dependencies
#### Gems
twilio-ruby
dotenv

#### .env
Rename `sample.env` to `.env`

#### Twilio Credentials
Fill out the `.env` with your Twilio credentails.
