class AppWorker
  include Sidekiq::Worker

  def perform(app_name)
  	ApplicationService.new(app_name).create_app
  end
end