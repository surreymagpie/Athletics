module Importable

  extend ActiveSupport::Concern

  module ClassMethods
    def import_spreadsheet(file)
      case File.extname(file.original_filename)
      when '.csv'  then Roo::CSV.new(file.path)
      when '.xls'  then Roo::Excel.new(file.path, nil, :ignore)
      when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
      when '.ods'  then Roo::OpenOffice.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end
  end
end