require 'simplecov'
SimpleCov.start

require_relative '../board'
require_relative '../piece'
Dir.glob(File.expand_path("../../piece/*.rb", __FILE__)).each do |file|
  require file
end

class Object
  def try(method)
    send method if respond_to? method
  end
end

