require "#{Dir.pwd}/lib/application_settings.rb"
AS.c = YAML.load_file("config/application_settings.yml")["all"]
AS.append_c = YAML.load_file("config/application_settings.yml")[Rails.env]

# Disable root element in JSON by default.
ActiveSupport.on_load(:active_record) do
  self.include_root_in_json = false
end