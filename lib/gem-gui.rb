require 'tk'
require 'tkextlib/tktable'
require 'rubygems'

require 'tik_tak'

module Gem
  module Gui
    
    class Base
      include TikTak
      
      def initialize
        root :title => 'Gem Browser', 
             :pady => 15, :padx => 15, :resizable => [0,0]
        
        top(:pady => 10) do
          add Tk::TkTable, :table
          gui[:table].insert_rows 100
          # *gem_list.map(&:inspect)
          gem_list.each do |gem|
            label nil, gem.inspect
            puts gem.inspect
          end
          # paned_window nil, :takefocus => nil, :highlightcolor => nil
        end
        
      end
      
      def gem_list
        dep = Gem::Dependency.new '', Gem::Requirement.default

        specs = Gem.source_index.search dep

        spec_tuples = specs.map do |spec|
          [[spec.name, spec.version, spec.original_platform, spec], :local]
        end
      end
      
    end
    
  end
end

Gem::Gui::Base.new.start