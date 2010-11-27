require 'fog'
require 'yaml'

class CloudBot

  def self.create!(project_path)
    opts = YAML.load_file("#{project_path}/config.yml")
    hash = {}
    opts.each { |k, v| hash[k.to_sym] = v }
    opts = hash
    opts[:image_id] ||= "ami-4a34013e" # Ubuntu 10.04 32 bit
    opts[:region] ||= "eu-west-1"

    create_opts = [ :key_name, :image_id, :groups ]
    connection = Fog::AWS::Compute.new(opts.reject { |k, v| create_opts.include?(k) })

    server = connection.servers.create(opts)
    loop do
      if server.reload.state == 'running'
        # SSH access isn't available right away
        sleep 10
        break
      end
      sleep 5
    end
    
    system "scp -o StrictHostKeyChecking=no -r -i #{project_path}/ec2_key.pem #{project_path}/installer ubuntu@#{server.dns_name}:~ &> /dev/null"
    system "ssh -o StrictHostKeyChecking=no -i #{project_path}/ec2_key.pem ubuntu@#{server.dns_name} 'cd installer; sudo sh install.sh' &> /dev/null"
    
    server
  end

  def self.create_swarm!(count, config_path)
    servers = []

    threads = []
    count.times do
      threads << Thread.new {
        servers << create!(config_path)
      }
    end

    threads.each { |thread| thread.join }

    servers
  end

end

