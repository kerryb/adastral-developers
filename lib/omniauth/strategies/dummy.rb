module OmniAuth
  module Strategies
    class Dummy
      include OmniAuth::Strategy

      info do
        {
          name: "Fred Bloggs",
        }
      end
    end
  end
end
