An example of how to use [testbot](http://github.com/joakimk/testbot) with Amazon EC2 using [fog](https://github.com/geemus/fog).

Usage
----

# Get an AWS account
# Setup a testbot server
# Customize the example for your environment
# Create cloud bots:

    require 'cloud_bot'
    server = CloudBot.create!("example")
    # server.destroy
