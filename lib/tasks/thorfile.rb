class JsonExportTasks < Thor
  include Dradis::Plugins::thor_helper_module.to_s.constantize

  namespace     "dradis:plugins:json"

  desc 'export', 'export the current repository structure as a JSON document'
  method_option :output, type: :string, desc: "the report file to create (if ends in .json), or directory to create it in"
  method_option :template, type: :string, desc: "the template file to use. If not provided the value of the 'advanced_word_export:docx' setting will be used."

  def export
    require 'config/environment'

    # The options we'll end up passing to the Processor class
    opts = {}

    STDOUT.sync = true
    logger = Logger.new(STDOUT)
    logger.level = Logger::DEBUG
    opts[:logger] = logger
    content_service = nil

    detect_and_set_project_scope

    json = Dradis::Plugins::Json::Exporter.new.export({
      content_service: content_service_for(Dradis::Plugins::Json),
    })

    File.open(report_path, 'w') do |f|
      f << json
    end

    logger.info{ "Report file created at:\n\t#{report_path}" }
    logger.close

  end


end
