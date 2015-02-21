require 'optparse'

class GGIT

  # init
  def initialize(args, stdin)
    parse_commands(args)
  end

  private

  def parse_commands(args)
    @commands = {}
    display_usage("#!Error: No commands") if args.size == 0
    args.each do |arg|
      case arg
        when "is-git"
            `source ./thisfile.sh`
          break
        else
          display_usage("#!Error: Uknown command")
      end
    end
  end

  # this piece of code is the most important
  def set_current_branch
    @current ||= `git branch | grep "*" | awk '{print $2}'`.strip
  end


  def display_usage(msg=nil)
    puts "#{msg}\n\n" unless msg.nil?
    puts "Usage:\n\n"
    puts "g_ is-git?            :Check if is a git repo.\n"
  end
end

