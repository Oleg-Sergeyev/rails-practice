require 'sneakers'
require 'json'
require 'date'

class Processor
  include Sneakers::Worker
  from_queue :docs

  def work(msg)
    doc = JSON.parse(msg)
    if doc["type"] == "passport"
	File.open('passports.log', 'a') do |f|
	  f.write("#{DateTime.now()}: #{doc["number"]} - #{doc["status"]}\n")
	end
    end
    ack!
  end
end