module Dradis::Plugins::Json
  class Engine < ::Rails::Engine
    isolate_namespace Dradis::Plugins::Json

    include Dradis::Plugins::Base
    provides :export
    description 'Export results in JSON format'

    initializer 'dradis-json.mount_engine' do
      Rails.application.routes.append do
        mount Dradis::Plugins::Json::Engine => '/export/json'
      end
    end

  end
end
