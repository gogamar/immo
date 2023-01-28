every '0 6 * * *' do
  rake 'import_realestates_job:run'
end
