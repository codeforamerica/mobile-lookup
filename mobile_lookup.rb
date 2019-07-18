# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'
require 'dotenv/load'
require 'csv'

# Your Account Sid and Auth Token from twilio.com/console
# DANGER! This is insecure. See http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

csv_file_path = ARGV[0]
phone_column_name = ARGV[1]

input = CSV.read(csv_file_path, headers: true)

index = 3 # default
if phone_column_name
  input.headers.each do |header|
    if phone_column_name.downcase == header.downcase
      index = input.headers.find_index(header)
    end
  end
end

CSV.open("output.csv", "wb") do |csv|
  new_headers = input.headers
  new_headers << 'mobile'
  csv << new_headers

  input.each do |row|
    response = @client.lookups
    .phone_numbers(row[index])
    .fetch(type: ['carrier'])

    if response.carrier['type'] == 'mobile'
      row << 'mobile'
      csv << row
    end
  end
end
