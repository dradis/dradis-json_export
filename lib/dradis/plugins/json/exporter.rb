module Dradis::Plugins::JSON

  class Exporter < Dradis::Plugins::Export::Base
    def export(args={})

      issues = content_service.all_issues

      result = issues.map do |issue|
        { issue: issue.fields }
      end

      JSON.pretty_generate(result)
    end
  end
end
