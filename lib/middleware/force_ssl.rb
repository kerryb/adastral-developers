class ForceSSL
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["HTTPS"] == "on" || env["HTTP_X_FORWARDED_PROTO"] == "https" || env['PATH_INFO'].start_with?("/admin")
      @app.call(env)
    else
      req = Rack::Request.new(env)
      [301, { "Location" => req.url.gsub(/^http:/, "https:") }, []]
    end
  end
end
