# CommitBook Homebrew tap

Homebrew formula for [CommitBook](https://github.com/CommitBook/CommitBook-Core),
automated Git commits and sync for Markdown notes. macOS and Linux, arm64 and
x86_64.

## Install

```sh
brew install commitbook/tap/commitbook
```

This installs `commitbook`, `cobo` (short alias), `commitbook-tui`, and
`commitbook-web`, plus their license notices. Installing does not start a
scheduler. In each notes repository, run:

```sh
commitbook init
commitbook start
```

## Upgrade

Stop scheduled syncs before upgrading, then start them again:

```sh
commitbook stop           # in each scheduled notes repository
brew update && brew upgrade commitbook
commitbook start          # in each of those repositories again
```

## Maintenance

`Formula/commitbook.rb` is generated, verified, and published by the
CommitBook-Core S3 workflow from each release. Do not edit it by hand; changes
are overwritten by the next release. See the
[Core workflow docs](https://github.com/CommitBook/CommitBook-Core/blob/main/docs/workflows.md).
