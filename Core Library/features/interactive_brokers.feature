Feature: Interactive Brokers
	In order to determine the front month Bitcoin future contract
	As a CLI
	I want to use the CME Group product calendar and verify with Interactive Brokers

	Scenario: BTC
		When I run `mtw BTC`
		Then the output should contain "Front month:"