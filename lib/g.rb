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
        when "switch"
          # branch -> is the branch to switch
          branch = args[1] ? args[1] : 'master'
          # branches -> list of branches to check if is listed or not
          branches = `git branch`.split
          if branches.include? branch
            # If exist
            `git checkout #{branch}`
          else
            # Not exists, so create it
            `git checkout -b #{branch}`
          end
          break
        when "rebase"
          # branchs to rebase [not upstream]
          branch1 = args[1]
          branch1 = args[2]
          # rebase work
          # Not sure if this will work or is the correct
          # way to do it. DO NOT USE IT
          `git rebase #{branch1} #{branch2}`
          break
        when "fork"
          # branch -> the branch you want to update 
          # at your fork
          branch = args[1] ? args[1] : 'master'
          # this is the way I do it, but needs to be
          # extended to all the user cases. DO NOT USE IT
          `git pull --rebase upstream #{branch}`
          `git push origin -f #{@current}`
          break
        when "del-branch"
          # I am thinking if this should remove local and 
          # remote tags. Let's hear some feedback about
          # this and decide it later.
          branch = args[1] ? args[1] : '#{@current}'
          `git branch -D #{branch}`
          break
        when "revert"
          # I am thinking if this should remove local and 
          # remote tags. Let's hear some feedback about
          # this and decide it later.
          commit = args[1]
          `git branch -D #{commit}`
          break
        when "log"
          # I know this has not full avantage but it will
          # help someone.
          `git log`
          break
        when "commit"
          # here we need find the way to get the text
          # inside "". DO NOT USE IT
          message = args[1]
          # let's include everything that changed in the
          # commit
          `git add --all`
          `git commit -m "#{message}"`
          break          
        when "squash"
          # we squash in base of commits on current branch
          commits = args[1] ? args[1] : ''
          if commits == ''
            display_usage("#!Error: You must set a number higher than 0")
            break
          end
          `git rebase -i HEAD~#{commits}`
          break
        when "push"
          set_current_branch
          # push everything on current branch. Do you
          # want to push commits from other branch?
          # use 'switch' first.
          `git push origin #{@current}`
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
    puts "g! switch [branch]             :Change to [branch]. If not exists it will be created.\n"
    puts "g! rebase [branch1] [branch2]  :Rebase branch with in base of other branch.\n"
    puts "g! fork [branch]               :Update your from with original repo code.\n"
    puts "g! revert [commit]             :Revert a commit.\n"
    puts "g! log                         :Show all your commit logs.\n"
    puts "g! del-branch [branch]         :Delete a branch locally.\n"
    puts "g! commit ['message']          :Commit all the changes on your branch with a message.\n"
    puts "g! squash [number-of-commits]  :Squash in one commit all the commits you want\n"
    puts "g! push                        :Push all the commits in your current branch to remote.\n"
  end
end

