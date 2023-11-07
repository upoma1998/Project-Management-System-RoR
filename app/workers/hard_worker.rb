# app/workers/hard_worker.rb
class HardWorker
  include Sidekiq::Worker

  def perform()
    p 'Hello World!'
  end
end