env :PATH, ENV['PATH']
job_type :runner,  "cd :path && bin/rails runner -e :environment ':task' :output"

every 60.minutes do
  runner 'GetWeatherService.()', environment: 'development'
end
