require File.join(File.dirname(__FILE__),'router')
class Application
	attr_reader :router

	def initialize
		@router = Router.new
	end
end
