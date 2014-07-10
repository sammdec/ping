class Ping < Sinatra::Application

  before do
    headers 'Access-Control-Allow-Origin' => '*',
            'Access-Control-Allow-Methods' => ['POST']
  end

  get '/' do
    @ping = $redis.get('teacherping')
    erb :index
  end

  # Light endpoints
  get '/teacher' do
    @ping = $redis.get('teacherping')
    if @ping
      $redis.del('teacherping')
      {pattern: @ping}.to_json
    end
  end

  get '/assistant' do
    @ping = $redis.get('assistantping')
    if @ping
      $redis.del('assistantping')
      {pattern: @ping}.to_json
    end
  end

  # Trigger endpoints
  post '/pingteacher' do
    $redis.set('teacherping', 'teacher ping')
  end

  post '/pingassistant' do
    $redis.set('assistantping', 'assistant ping')
  end

end