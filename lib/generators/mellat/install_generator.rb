module Mellat
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates Jem initializer for your application"

      def copy_initializer
        template "mellat_initializer.rb", "config/initializers/mellat.rb"

         puts <<~EOF
        \e[36mInstall complete 👻 \e[0m
          For report issues or suggest contact me on twitter: \e[32m@mm580486\e[0m 
         EOF

      end

    end
  end
end