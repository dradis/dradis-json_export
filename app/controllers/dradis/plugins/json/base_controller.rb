module Dradis
  module Plugins
    module JSON
      class BaseController < Dradis::Plugins::Export::BaseController
        skip_before_action :validate_template

        def index
          opts = {
            project_id: export_params[:project_id],
            scope: export_params[:scope]
          }

          exporter = Dradis::Plugins::JSON::Exporter.new(opts)
          json = exporter.export

          render json: json
        end
      end

    end
  end
end
