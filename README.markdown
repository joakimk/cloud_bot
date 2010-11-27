An example of how to use [testbot](http://github.com/joakimk/testbot) with Amazon EC2 using [fog](https://github.com/geemus/fog).

Preparing
----

1. Get an AWS account.
2. Setup a testbot server.
3. Customize the example for your environment.

Usage
----

    require 'cloud_bot'
    server = CloudBot.create!("example")
    # server.destroy

