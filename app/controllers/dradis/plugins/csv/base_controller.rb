module Dradis
  module Plugins
    module CSV
      class BaseController < Dradis::Plugins::Export::BaseController

        def index
          # these come from Export#create
          export_manager = session[:export_manager].with_indifferent_access

          exporter = Dradis::Plugins::CSV::Exporter.new(
            content_service: export_manager[:content_service].constantize.new
          )
          csv = exporter.export(
            template: export_manager[:template]
          )

          send_data csv, filename: "dradis_report-#{Time.now.to_i}.csv",
                                type: 'text/csv',
                                disposition: 'inline'
        end
      end

    end
  end
end
