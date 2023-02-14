# Contributing

These guidelines **only apply to this fork** of Mastodon (i.e. the code that
powers [`cutie.city`]). If you're looking to contribute to [`glitch-soc`] or to
[`mastodon`] itself, please see their respective guidelines and open your issues
and/or pull requests in the appropriate repository.

[`cutie.city`]: https://cutie.city
[`glitch-soc`]: https://github.com/glitch-soc/mastodon/blob/main/CONTRIBUTING.md
[`mastodon`]: https://github.com/mastodon/mastodon/blob/main/CONTRIBUTING.md

With that out of the way... thank you for your interest in contributing to this
project! We encourage and value all types of contributions. If you haven't
already done so, please take a few minutes to read our [code of conduct][coc]
and make sure you wholeheartedly agree to abide by it. 💖

## Pull Requests

Want to contribute some code and/or documentation to this project? That's
awesome! Feel free to fork the repo and open a PR with any changes you'd like to
propose. And don't worry about your potential contributions being "too small",
even if you're just fixing a typo or rewording a sentence to be more clear. Any
improvements are welcome and very much appreciated - so **thank you** in
advance!

### After you open a PR

The [pre-commit](https://pre-commit.com/) CI service will run some checks to
ensure that your changes keep this project [clean, green, and healthy][ci].

- Some failing checks may be automatically fixed by the service, and the
  resulting changes will be added to your PR as a subsequent commit.
- Some things may require manual fixing. You can make the requested changes in
  your local copy of the repo, then commit and push to your PR branch again.
  This will update the PR and trigger a re-run of all the checks.

Once your PR passes **all pre-commit checks**, a project maintainer will review
it.

- If the maintainer asks for any changes: make the necessary edits, commit and
  push to your PR branch, and then ask for another review. This back-and-forth
  may happen more than once, especially if your changes are non-trivial.
- If the maintainer decides to pass on your PR, they will thank you for the
  contribution and explain why they won't be accepting those particular changes.
  That's okay! We still really appreciate you devoting your time to help improve
  this project, and hope to see other contributions from you in the future. 💗
- If the maintainer accepts your PR, it will be merged into the repository's
  `main` branch. This means that your contribution has officially become part of
  this project and will be distributed to our users soon! 🎉

### Licensing

This project, like its upstream repositories, is licensed under the
[GNU AGPL v3.0](https://www.gnu.org/licenses/agpl-3.0.html). All contributions,
forks, and usage of this codebase **must** adhere to that license, as stipulated
by the [`LICENSE`](/LICENSE) file in this repository.

Furthermore, by submitting a pull request to this project, you certify that you
authored or otherwise have the necessary rights to submit **all** of the code
contained in that PR. Essentially, your contributions must comply with the
[Developer Certificate of Origin](https://developercertificate.org/), which
protects this fork and all of its contributors. For more information, please see
[this page][dco-info].

[ci]: https://results.pre-commit.ci/latest/github/CutieCity/mastodon/main
[coc]: https://github.com/CutieCity/.github/blob/main/.github/code_of_conduct.md
[dco-info]:
  https://github.com/nuztalgia/.github/blob/main/.github/developer_certificate.md
