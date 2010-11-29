An example of how to use [testbot](http://github.com/joakimk/testbot) with Amazon EC2 using [fog](https://github.com/geemus/fog).

Usage
----

Given that you have an AWS account, a testbot server and have customized the "example" configuration you run something like:

    require 'cloud_bot'
    server = CloudBot.create!("example")
    # server.destroy

Benchmarks
----

See [https://gist.github.com/720660](https://gist.github.com/720660])

