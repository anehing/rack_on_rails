require File.join(File.dirname(__FILE__),'response')

class RequestController
  def call(env)
	    route = MyApplication.router.right_route(env)
       if route
			response = route.execute
			return response.rack_response
       else
       		return [404,{},['404']]
       end
  end
end
