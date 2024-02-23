# app/workers/hard_worker.rb
class HardWorker
  include Sidekiq::Worker

  def perform()
      p 'Hello World!'

    if Organization.all.count > 0
      puts "backup running .....AT: #{Time.zone.now}"
      organizations=Organization.all
        organizations.each do |organization|
          Store.create(email: organization.email, password:organization.password, confirm_password:organization.confirm_password, name:organization.name, created_at:organization.created_at, updated_at:organization.updated_at)

        end
    else
      puts "No data to backup.....AT: #{Time.zone.now}"
    end
  end
end
