namespace :import_realestates_job do
  task run: :environment do
    ImportRealestatesJob.perform_later
  end
end
