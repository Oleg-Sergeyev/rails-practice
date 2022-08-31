# frozen_string_literal: true

desc 'Отправка сообщение через RabbitMQ'
task(:send_passports_status) do
  conn = Bunny.new
  conn.start
  passports = [{ number: '456456', status: 'valid' },
               { number: '654654', status: 'invalid' },
               { number: '123123', status: 'valid' },
               { number: '895655', status: 'valid' }]
  ch = conn.create_channel
  passports.each do |hash|
    ch.default_exchange.publish({ type: 'passport',
                                  number: hash[:number],
                                  status: hash[:status] }.to_json, routing_key: 'docs')
  end
  conn.close
end
