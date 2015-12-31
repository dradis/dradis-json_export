module Dradis
  module Plugins
    module CSV
      class BaseController < Dradis::Plugins::Export::BaseController

        def index
          # these come from Export#create
          export_manager_hash   = session[:export_manager].with_indifferent_access
          content_service_class = export_manager_hash[:content_service].constantize

          exporter = Dradis::Plugins::CSV::Exporter.new(
            content_service: content_service_class.new(plugin: Dradis::Plugins::CSV)
          )
          csv = exporter.export(export_manager_hash)

          send_data csv,
            disposition: 'inline',
            filename: "dradis_report-#{Time.now.to_i}.csv",
            type: 'text/csv'
        end
      end

    end
  end
end
