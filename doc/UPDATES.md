### changes in order of magnitude
- shell.nix
- syntax highlighting
- `named` option in posts
- minor rss stuff
- minor style fixes

Most importantly, when I switched to macOS, some of the commands didn't work perfectly since macOS utils are slightly different from GNU coreutils.

To remedy this, a [shell.nix](../shell.nix) was added that uses nix to automatically provide a shell with GNU coreutils, m4, make etc. so dev environment is standard across OS. This means we can also use nix to get cmark-gfm, so there are modifications that prefer to use that and then have the prebuilt cmark-gfm binaries as a fallback. I also built it for macOS before I added cmark-gfm to shell.nix. This works with direnv so whenever I cd into the repo, the shell gets activated.

There is also code syntax highlighting now by using prism.js, I know what you're thinking, omg js, but since it only adds a nice thing and the website would still be functional for noJS people, I don't mind. It required modifying the theme template to include the css and js files that's it. Ah and also modifying the Makefile where it had a weird bug that prism.css's contents would get overwritten by style.css contents.

I also fixed rss so now it's parsed by all rss readers. 

There is a `named` option supported now, that allows you to customize the url to a blog post. For example I now have <https://aadibajpai.com/blog/gsoc.html> which otherwise would have the random id thing in the url. 

Some other minor style changes, including fixing some overflow stuff so it renders correctly on mobile.

I will keep adding stuff here as it gets added / modified and hopefully I remember to do it often.