# My Trade Wizard

My Trade Wizard is an open-source platform for automating trading systems.  It targets the Interactive Brokers API, and supports stocks & futures.  There are 3 main components:

- **Core Library**: is a Ruby gem that defines a Domain Specific Language for creating your own trading systems, and provides them with market data & execution capabilities.

- **Interactive Brokers GUI automation**: is an AutoIt script for automating the Interactive Brokers Trader Workstation on Windows.

- **Sample Trading Systems**: contains examples of automated trading systems built using the Core Library.  There is an example that trades *Bitcoin Futures*, and an example that trades a *Stock Watchlist*.