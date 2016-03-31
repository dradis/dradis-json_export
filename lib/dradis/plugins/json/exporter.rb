module Dradis::Plugins::JSON

  class Exporter < Dradis::Plugins::Export::Base
    def export(args={})

      issues = content_service.all_issues

      if issues.empty?
        return "The project didn't contain any issues"
      else
        require 'rubygems'
        require 'json/pure'

        # Add a blank array to fill with the Issue data 
        array = []
        # Each issue in the project is added as a new hash to the array
        issues.each do |issue|
          array << {:issue => issue.fields}
        end
        return JSON.pretty_generate(array, :indent => "\t")
      end
    end
  end
end
