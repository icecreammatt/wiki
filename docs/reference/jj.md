# jj

```bash
$ jj new # create new change
$ jj new -m "message" # create new change including description
$ jj undo # undo last operation
$ jj abandon # ditch changes
$ jj new xyz # make a new change after a change
$ jj log # show commits
$ jj st # show current status
$ jj edit xyz # edit existing change
$ jj show xyz # show info on change
$ jj diff # show diff between last change
$ jj describe -m "message"
$ jj describe @- -m "docs: add more references" # edit message on previous change
$ jj -r 'all()' # show all commits
$ jj log -r 'tags() | bookmarks()' # show tags and bookmarks
$ jj push --allow-new --remote origin # push changes
$ jj bookmark set branch_name # set a branch name
$ jj config set --user user.email "email@site.com"
$ jj config set --user user.name "First Last"
$ jj git fetch
$ jj git init --git-repo .
$ jj git remote add origin git@github.com:user/repo.git
$ jj descripion('search string') # search on commit messages
$ jj squash -i -f xyz -t abc -i 
$ jj squash -i --into x # squash into a specific change into the tree
$ jj split
$ jj new a b c # create new merge from existing changes

```

## New repo setup

```bash
git init
jj git init --colocate
```

## Initialize repo

```bash
$ git init --git-repo <path to repo>
```

## Pushing
```bash
jj bookmark set main -r @-     # previous change or @ for current
jj bookmark track main@origin  # only need one time per branch
jj git push -r @-
```

## Examples
https://github.com/jj-vcs/jj/blob/main/docs/revsets.md#examples

## operators
https://github.com/jj-vcs/jj/blob/main/docs/revsets.md#operators

## list changes between bookmarks that are pushed to a remote

```bash
$ jj log -r 'ancestors(@) & main::'
```

## bookmark a change

> This locks the changes below from editing once pushed up

```bash
$ jj bookmark set branch
```

## Listing bookmarks

> Show all remote bookmarks by an author

```bash
$ jj -r 'remote_bookmarks() & author("icecreammatt")'
```

> Show all with a given name
```bash
$ jj -r 'bookmarks("branch-name")'
```

## Recover or undo changes that were a while ago

```bash
$ jj op log
# find the operational state you wish to restore to
$ jj op restore <operation id>
```

## Inspect what an operation did

```bash
$ jj op show <operation id>
```

## References
- [what-ive-learned-from-jj](https://zerowidth.com/2025/what-ive-learned-from-jj/)
- [jj-tips-and-tricks](https://zerowidth.com/2025/jj-tips-and-tricks/)
- [jujutsu-tutorial](https://steveklabnik.github.io/jujutsu-tutorial/)
- [install-and-setup](https://jj-vcs.github.io/jj/latest/install-and-setup/)
- [tutorial](https://jj-vcs.github.io/jj/v0.13.0/tutorial/)
- [jj-init](https://v5.chriskrycho.com/essays/jj-init/)
- [jujutsu-merge-workflow](https://ofcr.se/jujutsu-merge-workflow)
- [git-comparison.md#the-index](https://github.com/jj-vcs/jj/blob/main/docs/git-comparison.md#the-index)
- [In-Praise-of-Stacked-PRs](https://benjamincongdon.me/blog/2022/07/17/In-Praise-of-Stacked-PRs/)
- [Branchless-Git](https://benjamincongdon.me/blog/2021/12/07/Branchless-Git/)
- [Working branches and the JJ "way"](https://github.com/jj-vcs/jj/discussions/2425)
- [some-hot-jj-tips](https://willhbr.net/2024/05/26/some-hot-jj-tips/)
- [mega merge and absorbe](https://v5.chriskrycho.com/journal/jujutsu-megamerges-and-jj-absorb/)
