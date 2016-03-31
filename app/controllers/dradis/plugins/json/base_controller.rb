module Dradis
  module Plugins
    module JSON
      class BaseController < Dradis::Plugins::Export::BaseController

        def index
          # these come from Export#create
          export_manager_hash   = session[:export_manager].with_indifferent_access
          content_service_class = export_manager_hash[:content_service].constantize

          exporter = Dradis::Plugins::JSON::Exporter.new(
            content_service: content_service_class.new(plugin: Dradis::Plugins::JSON)
          )

          doc = exporter.export(export_manager_hash)

          render type: 'text/html', text: doc
        end
      end

    end
  end
end
