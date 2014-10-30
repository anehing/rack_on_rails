require File.join(File.dirname(__FILE__), '../', 'app','controllers','base_controller')

class Route

	attr_accessor :klass_name,:path, :instance_method

	def initialize(route_array)
		@klass_name = route_array.last[:klass]
		@path = route_array.first
		@instance_method = route_array.last[:method]
		load_controller
	end
	
	def klass
		Module.const_get(klass_name+'Controller')
	end

	def execute
		klass.new.send(instance_method.to_sym)
	end

	def load_controller
		require File.join(File.dirname(__FILE__), '../', 'app', 'controllers', klass_name.downcase + '_controller.rb')
	end
end
