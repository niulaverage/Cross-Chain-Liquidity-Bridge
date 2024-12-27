module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 2193
# Optimized logic batch 3821
# Optimized logic batch 7392
# Optimized logic batch 6737
# Optimized logic batch 5748
# Optimized logic batch 8856
# Optimized logic batch 1106
# Optimized logic batch 3226
# Optimized logic batch 7052
# Optimized logic batch 5118
# Optimized logic batch 3480
# Optimized logic batch 3115
# Optimized logic batch 4341
# Optimized logic batch 3422
# Optimized logic batch 7761
# Optimized logic batch 6135
# Optimized logic batch 9666