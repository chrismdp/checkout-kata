require 'sinatra'

require File.dirname(__FILE__) + "/lib/checkout"

run Sinatra::Application

checkout = Checkout.new

get '/' do
  """
    <h1>Checkout</h1>

    #{checkout.total}

    <form action='/scan' method='post'>
      <input type='text' name='item'/>
      <input type='submit' value='scan'/>
    </form>
  """
end

post '/scan/?' do
  checkout.scan("A")
  redirect '/'
end
