# CsvExport

require 'csv_export/actions'
require 'csv_export/version'

require 'csv'

module CsvExport
  class Configuration < Core::Configurator
    configure :namespace => 'csv_export'
  
    # Because this is an Export plugin, we need a Category to assign the notes
    # we are going to be working with
    setting :category, :default => 'CSV ready'
  end

  module Actions
    # first action
    def to_csv(params={})
      # locate our Category (will be different in ever Dradis installation)
      csv_category = Category.find_by_name( Configuration.category )

      # Find the notes that are assigned to our category
      notes = Note.where(:category_id => csv_category)

      # Create the CSV data
      csv_string = ::CSV.generate do |csv|

        # Add the header line with all the field names. Remember note.field returns
        # a hash: {'Title' => 'Foo', 'Description' => 'Bar'}
        csv << notes.first.fields.keys

        # For each of the notes in our category, we dump the field values.
        # This assumes all notes have the same fields, in the same order
        notes.each do |note|
          csv << note.fields.values
        end
      end

      # While debugging, it's ok to render the results in the browser
      render :type => 'text/html', :text => csv_string

      # For the final plugin, send the resulting CSV data as a downloadable file
      # send_data csv_string, :filename => 'dradis-results.csv'
    end
  end
end

# This includes the export plugin module in the dradis export plugin repository
module Plugins
  module Export
    include CsvExport
  end
end
