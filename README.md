# g!
The basic purpose is to provide some simple automations based upon common git workflows

## Installation
From Rubygems:
```
$ gem install g!
```

From github:
```
$ gem "g!", :git => "git://github.com/Gioyik/g.git"
```

From source:
```
$ gem build g.gemspec
$ gem install ./g!-X.X.X.gem
```

## Usage

Switch branches. If no branch is provided it will default to 'master'.  If the provided branch does not exist, it is created.
```
$ g! switch [branch]
```

Rebase branch with in base of other branch. **DO NOT USE THIS FUNCTION, IS NOT COMPLETE**
```
$ g! rebase [branch1] [branch2]
```

Push all the commits in your current branch to remote.
```
$ g! push
```

Revert a commit.
```
$ g! revert [commit]
```

Update your from with original repo code.
```
$ g! fork [branch] 
```

Log your git repository.
```
$ g! log 
```

Delete a branch locally. If you want to delete it remotely too, do `g! push` after this commit. ** NOTE ** If the branch is not specified it will delete the current branch you are. Be carefull!
```
$ g! fork [branch] 
```

Commit all the changes on your branch with a message.
```
$ g! commit ['message']
```

Squash in one commit all the commits you want.
```
$ g! squash [number-of-commits]
```

## License
This tool is licensed under MIT terms.