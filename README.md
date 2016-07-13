# homebrew-jsoncat
Homebrew Formula for [Jsoncat](https://github.com/pantuza/jsoncat), the Json pretty-print parser.

### How to install

```bash
$> brew tap pantuza/homebrew-jsoncat
$> brew install jsoncat
```

### How to update Formula

To update Formula do the following tasks:

1. Update jsoncat version at Formula/jsocat.rb
2. Run 'make update' to check if the sha256 of the tarball changed. If yes it
   will update Formula file.
3. Commit and push changes to remote

### How to test Formula updates

To untap the previous Formula run:

```bash
$> brew untap pantuza/homebrew-jsoncat
```

Then, repeat the install process.


See the full documentation at [project page on github](https://github.com/pantuza/jsoncat)
