module Dradis
  module Plugins
    module Json
      class BaseController < Dradis::Plugins::Export::BaseController

        def index
          # these come from Export#create
          export_manager_hash   = session[:export_manager].with_indifferent_access
          content_service_class = export_manager_hash[:content_service].constantize

          exporter = Dradis::Plugins::Json::Exporter.new(
            content_service: content_service_class.new(plugin: Dradis::Plugins::Json)
          )

          doc = exporter.export(export_manager_hash)

          render text: doc
        end
      end

    end
  end
end
