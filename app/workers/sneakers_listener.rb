# frozen_string_literal: true

# class GetPassport
class SneakersListener
  include Sneakers::Worker
  from_queue :docs

  def work(msg)
    doc = JSON.parse(msg)
    logger.info { "#DATE: #{DateTime.now} #NUMBER: #{doc['number']} #STATUS: #{doc['status']}" }
    ack!
  end
end
