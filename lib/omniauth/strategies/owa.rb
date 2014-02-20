module OmniAuth
  module Strategies
    class Owa
      include OmniAuth::Strategy

      info do
        {
          name: "Fred Bloggs",
        }
      end
    end
  end
end
