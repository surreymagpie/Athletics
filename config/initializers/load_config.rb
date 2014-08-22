# Load the application configuration from config.yml if it exists
file = Rails.root + 'config/config.yml'
CONFIG = File.exists?(file) ? YAML.load_file(file) : nil
