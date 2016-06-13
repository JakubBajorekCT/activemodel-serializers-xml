require 'active_support'
require 'active_support/lazy_load_hooks'
require 'active_model'
require "active_model/serializers/version"

ActiveSupport.on_load(:active_model) do
  require "active_model/serializers/xml"
end

module ActiveModel
  module Serializers
    extend ActiveSupport::Autoload

    eager_autoload do
      autoload :Xml
    end
  end

  def self.eager_load!
    super
    ActiveModel::Serializers.eager_load!
  end
end
