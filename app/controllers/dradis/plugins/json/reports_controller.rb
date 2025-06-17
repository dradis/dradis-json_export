module Dradis
  module Plugins
    module JSON
      class ReportsController < Dradis::Plugins::Export::BaseController
        skip_before_action :validate_template

        def create
          exporter = Dradis::Plugins::JSON::Exporter.new(export_params)
          json = exporter.export

          render json: json
        end
      end
    end
  end
end
