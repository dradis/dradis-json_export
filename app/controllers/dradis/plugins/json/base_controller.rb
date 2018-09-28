module Dradis
  module Plugins
    module Json
      class BaseController < Dradis::Plugins::Export::BaseController

        def index
          exporter = Dradis::Plugins::Json::Exporter.new(export_options)
          json     = exporter.export

          render json: json
        end
      end

    end
  end
end
