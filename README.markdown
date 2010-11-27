An example of how to use [testbot](http://github.com/joakimk/testbot) with Amazon EC2 using [fog](https://github.com/geemus/fog).

Usage
----

1. Get an AWS account
2. Setup a testbot server
3. Customize the example for your environment
4. Create cloud bots:

    require 'cloud_bot'
    server = CloudBot.create!("example")
    # server.destroy
