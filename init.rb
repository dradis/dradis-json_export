require 'csv_export'

Category.find_or_create_by_name( CsvExport::Configuration.category )