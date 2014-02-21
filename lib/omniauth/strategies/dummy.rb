module OmniAuth
  module Strategies
    class Dummy
      include OmniAuth::Strategy
      OmniAuth.config.logger = Logger.new "/dev/null"

      info do
        {
          name: "Fred Bloggs",
          first_name: "Fred",
          last_name: "Bloggs",
          email: "fred.bloggs@example.com",
        }
      end
    end
  end
end
