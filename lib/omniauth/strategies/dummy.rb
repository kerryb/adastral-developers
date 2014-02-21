module OmniAuth
  module Strategies
    class Dummy
      include OmniAuth::Strategy
      OmniAuth.config.logger = Logger.new "/dev/null"

      info do
        {
          name: "Fred Bloggs",
        }
      end
    end
  end
end
