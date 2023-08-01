require 'singleton'
class MyLogger
    include Singleton
    def initialize
        @log = File.open("log.txt", "a")
    end

    def logInfo(information)
        @log.puts("START")
        @log.puts(information)
        @log.puts("END")
        @log.flush
    end

end