module Dradis
  module Plugins
    module Json
      # Returns the version of the currently loaded JSON as a <tt>Gem::Version</tt>
      def self.gem_version
        Gem::Version.new VERSION::STRING
      end

      module VERSION
        MAJOR = 0
        MINOR = 2
        TINY  = 0
        PRE   = nil

        STRING = [MAJOR, MINOR, TINY, PRE].compact.join(".")
      end
    end
  end
end
