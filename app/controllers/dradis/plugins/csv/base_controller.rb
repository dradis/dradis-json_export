module Dradis
  module Plugins
    module CSV
      BASE_CONTROLLER = Dradis.constants.include?(:Pro) ? ProjectScopedController : Dradis::Frontend::AuthenticatedController

      class BaseController < BASE_CONTROLLER

        def index
          # these come from Export#create
          export_manager = session[:export_manager].with_indifferent_access

          exporter = Dradis::Plugins::CSV::Exporter.new
          csv = exporter.export(export_manager)

          send_data csv, filename: "dradis_report-#{Time.now.to_i}.csv",
                                type: 'text/csv',
                                disposition: 'inline'
        end
      end

    end
  end
end