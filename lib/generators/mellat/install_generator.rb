module Mellat
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates Jem initializer for your application"

      def copy_initializer
        template "mellat_initializer.rb", "config/initializers/mellat.rb"

        puts "Install complete! Truly Outrageous!"
      end

    end
  end
end