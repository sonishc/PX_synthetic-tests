require 'sinatra'

get '/' do
  erb :index, locals: {status: 'Wait for build', execution_time: 0}
end

post "/run" do
  test_name = params["test"]
  start = Time.now
  status = system("rspec spec/#{test_name}")
  finish = Time.now
  diff = finish - start
  status = status ? 'passed' : 'failed'
  erb :index, locals: {status: status, execution_time: diff.round(2)}
end
