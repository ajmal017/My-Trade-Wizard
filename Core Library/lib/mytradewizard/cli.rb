require 'thor'
require 'mytradewizard'
require 'mytradewizard/generators/mytradewizard'

module MyTradeWizard
  class CLI < Thor

    desc "configure [--environment ENVIRONMENT] [--host HOST] [--port PORT] [--account ACCOUNT] [--email_to EMAIL_TO] [--gmail_username GMAIL_USERNAME] [--gmail_password GMAIL_PASSWORD]", "Generate Interactive Brokers configuration"
    method_options :environment => :string, :host => :string, :port => :numeric, :account => :string, :email_to => :string, :gmail_username => :string, :gmail_password => :string
    def configure
      MyTradeWizard::Generators::MyTradeWizard.start([options[:environment] || "local", options[:host] || "localhost", options[:port] || 7496, options[:account] || "", options[:email_to] || "", options[:gmail_username] || "", options[:gmail_password] || ""])
    end

    desc "config", "Display Interactive Brokers configuration"
    def config
      puts "Environment: " + MyTradeWizard::Configuration::ENVIRONMENT
      puts "Host: " + MyTradeWizard::Configuration::InteractiveBrokers::HOST
      puts "Port: " + MyTradeWizard::Configuration::InteractiveBrokers::PORT.to_s
      puts "Account: " + MyTradeWizard::Configuration::InteractiveBrokers::ACCOUNT
      puts "Email To: " + MyTradeWizard::Configuration::Email::TO
      puts "Gmail Username: " + MyTradeWizard::Configuration::Email::GMAIL_USERNAME
      puts "Gmail Password: " + MyTradeWizard::Configuration::Email::GMAIL_PASSWORD
    end

    desc "connect", "Connects to Interactive Brokers"
    def connect
      ib = MyTradeWizard::InteractiveBrokers.new
      ib.connect
    end

    desc "accounts", "Lists Interactive Brokers accounts"
    def accounts
      ib = MyTradeWizard::InteractiveBrokers.new
      ib.connect
      puts "Accounts: " + ib.accounts.join(", ")
    end

    desc "BTC", "Determines the front month Bitcoin future contract"
    def BTC
      ib = MyTradeWizard::InteractiveBrokers.new
      ib.connect
      puts "Front month: " + ib.front_month(:BTC).expiry
    end

  end
end