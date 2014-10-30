require File.join(File.dirname(__FILE__), 'route')
class Router
	attr_reader :routes

	def initialize
		@routes = Hash.new {|hash, key| hash[key] = []}
	end

	def config &block
		instance_eval &block
	end

	def get path,options={}
		@routes[:get] <<[path,parse_to(options[:to])] # {:get=>[["/test", {:klass=>"Custom", :method=>"index"}]
	end
    
    def right_route env
	 	path = env["PATH_INFO"]
		method = env["REQUEST_METHOD"].downcase.to_sym
	    route_array = routes[method].detect do |route|
	      case route.first
	      when String
	      	route.first
	        path == route.first
	      when Regexp
	        path =~ route.first
	      end
	    end
	     if route_array
	     	return Route.new(route_array)
	     else
	     	return nil
	     end
    end

	private
	def parse_to string
		klass,method = string.split('#')
		{:klass => klass.capitalize,:method=> method}
	end
end
