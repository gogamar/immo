namespace :import do
  desc "Import real estates from ghestia"
  task run: :environment do
    ImportRealestatesJob.perform_later
  end
end
