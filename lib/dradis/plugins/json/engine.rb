module Dradis::Plugins::JSON
  class Engine < ::Rails::Engine
    isolate_namespace Dradis::Plugins::JSON

    include Dradis::Plugins::Base
    provides :export
    description 'Export results in JSON format'

    initializer 'dradis-json.mount_engine' do
      Rails.application.routes.append do
        mount Dradis::Plugins::JSON::Engine => '/', as: :json_export
      end
    end
  end
end
