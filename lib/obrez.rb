module Obrez
  class App
    def initialize what
      @what = what
    end
    
    def call env
      sent = env.dup
      sent["rack.input"] = sent["rack.input"].read
      sent["rack.errors"] = ""
      
      IO.popen("obrez_cli.bat #{@what}", "rb+") {|f|
        Marshal.dump(sent, f)
        Marshal.load(f)   
      }
    end
  end
  
  def self.shoot app
    env = Marshal.restore(STDIN)
    env["rack.input"] = StringIO.new(env["rack.input"])
    env["rack.errors"] = $stderr

    status, headers, bdy = app.call(env)
    body = []; bdy.each {|x| body << x}
    Marshal.dump([status, headers.to_hash, body], STDOUT)
  end
end

      
