class CreateServerJob
  include Sidekiq::Worker

  def perform(id)
    i=rand(1..10)
    puts "Creating server #{id}..."
    sleep i
    puts "Creating srever #{id}..."

  end
end
