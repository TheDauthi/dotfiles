### TheDauthi's dotfiles
For years, I've hesitated committing dotfiles to source control.  "I don't have a lot in there.", I said.  "I don't want to have to set it up on every machine I work on.", I said.  I don't have a fancy .vimrc, or use zsh.  What convinced me?

Docker.

See, I like docker.  But there are a few subcommands that aren't built in to docker that really should be.  For example, some way of nuking a large number of images or containers at once, or removing all stopped containers.  Sure, I  can do it easily, but it never works *quite* as I remember it.  So I created aliases for it.  The aliases themselves are long - I'll generally get so far as typing docker before I remember that I don't remember the rmi syntax - but they're meant to ensure I get the syntax right, not to save typing.

So, then I started looking around on every machine I touched, and I found that I had actually aliased a lot of things over the years, or created configs.  I finally decided to take the leap: sync every machine.  And here's the result.
