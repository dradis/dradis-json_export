module Dradis::Plugins::CSV
  class Exporter < Dradis::Plugins::Export::Base
    def export(args={})
      content_service = args[:content_service].constantize.new
      template        = args[:template]

      issues = content_service.all_issues
      keys = issues.first.fields.keys

      # Create the CSV data
      csv_string = ::CSV.generate do |csv|

        # Add the header line with all the field names. Remember note.field returns
        # a hash: {'Title' => 'Foo', 'Description' => 'Bar'}
        csv << keys

        # For each of the notes in our category, we dump the field values.
        # This assumes all notes have the same fields, in the same order
        issues.each do |issue|
          csv << keys.map do |key|
            issue.fields.fetch(key, 'n/a')
          end
        end
      end

      csv_string
    end
  end
end