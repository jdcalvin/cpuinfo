require 'sinatra'
require 'json'

class CpuInfo < Sinatra::Base
  get '/' do
    format_cpuinfo.to_json
  end

  private

  def format_cpuinfo
    response = {}
    sanitized_to_array = cpuinfo.gsub("\t\t","\t")
                                .split("\n")
                                .map {|x| x.split("\t: ") }

    # convert [[k,v]] to hash
    sanitized_to_array.each do |k,v|
      formatted_key = k.gsub(" ", "_").downcase
      response[formatted_key] = v
    end

    # format individual attributes and return response
    response.tap do |response|
      response['flags'] = response['flags'].split(" ") if response['flags']
    end
  end

  def cpuinfo
    # virtual file found on linux distros that identifies the type of processor used by your system
    # https://www.centos.org/docs/5/html/5.1/Deployment_Guide/s2-proc-cpuinfo.html
    File.read("/proc/cpuinfo")
  rescue Errno::ENOENT => e
    ""
  end
end