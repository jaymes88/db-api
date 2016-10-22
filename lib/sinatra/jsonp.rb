require 'sinatra/base'
require 'json'

module Sinatra
  module Jsonp
    def jsonp(data)
      response = JSON.pretty_generate data

      callback = params.values_at('callback','jscallback','jsonp','jsoncallback').first
      response = "#{callback}(#{response})" if callback

      content_type :js
      response
    end
    alias JSONP jsonp
  end
  helpers Jsonp
end