# frozen_string_literal: true

require 'sneakers'

Sneakers.configure(connection: Bunny.new,
                   daemonize: false,
                   durable: true,
                   ack: true,
                   retry_timeout: 30,
                   retry_max_times: 3,
                   timeout_job_after: 60 * 5,
                   prefetch: 1,
                   log: 'log/sneakers.log',
                   pid_path: 'tmp/pids/sneakers.pid',
                   threads: 1,
                   workers: 1,
                   exchange: 'default_exchange',
                   exchange_type: 'direct')
Sneakers.logger.level = Rails.logger.level
