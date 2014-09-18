module Importable

  extend ActiveSupport::Concern

  module ClassMethods
    def import_spreadsheet(file)
      case File.extname(file.original_filename)
      when '.csv'  then Roo::CSV.new(file.path)
      when '.xls'  then Roo::Excel.new(file.path, file_warning: :ignore )
      when '.xlsx' then Roo::Excelx.new(file.path, file_warning: :ignore )
      when '.ods'  then Roo::OpenOffice.new(file.path, file_warning: :ignore )
      else
        false
      end
    end

    def to_csv(options ={})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |row|
          csv << row.attributes.values_at(*column_names)
        end
      end
    end
  end
end