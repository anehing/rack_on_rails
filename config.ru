require File.join(File.dirname(__FILE__),'lib' ,'request_controller')
require File.join(File.dirname(__FILE__),'lib','application')

MyApplication = Application.new

require File.join(File.dirname(__FILE__),'config','routes')

Rack::Handler::WEBrick.run(
  RequestController.new,
 	:Port=>9000
)
