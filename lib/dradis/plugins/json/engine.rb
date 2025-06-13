module Dradis::Plugins::JSON
  class Engine < ::Rails::Engine
    isolate_namespace Dradis::Plugins::JSON

    include Dradis::Plugins::Base
    provides :export
    description 'Export results in JSON format'

    initializer 'dradis-json.mount_engine' do
      Rails.application.routes.append do
        mount Dradis::Plugins::JSON::Engine => '/export/json'
      end
    end

    initializer 'dradis-json.inflections' do |app|
      ActiveSupport::Inflector.inflections do |inflect|
        inflect.acronym('JSON')
      end
    end
  end
end
