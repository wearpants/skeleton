# SKELETON

Project template, based on https://github.com/wearpants/skeleton

## Setup

### Global tools

We follow [Jacobian](https://jacobian.org/2019/nov/11/python-environment-2020/)'s approach. You
only need to do this once per machine. In summary:

1. Install [pyenv](https://github.com/pyenv/pyenv) with [Homebrew](https://github.com/pyenv/pyenv/#homebrew-on-macos)
on OSX, or the [Linux](https://github.com/pyenv/pyenv-installer) installer.
2. Run `make setup` to install tools globally: [pipx](https://pipxproject.github.io/pipx/), [poetry](https://python-poetry.org/docs/)

### Local install

1. Install dependencies: `make install`

## Development

- Activate a shell in the current environment: `poetry shell` **Do this before running most commands**
- Run a single command in the current environment: `poetry run pytest`
- Many commands are available in the `Makefile`; run `make help` for a list.

### Dependencies

This project uses `poetry` to manage dependencies (docs [here](https://python-poetry.org/docs/)).
*Don't use pip directly*

List all dependencies with in `pyproject.toml`. You can add a new dependency with `poetry add` or
`poetry add -D` for a development-only dependency.

If you change dependencies, or want to update to the newest compatible versions,
you can run `make lock`, which will generate a new poetry lockfile (`poetry.lock`) and `requirements.txt`.

After running `make lock`, run `make install` to update your development environment.

You should *always* keep the `poetry.lock` and `requirements.txt` committed in the git repository.

## Starting a new project from skeleton

1. Make a [new empty Github repository](https://github.com/new/import)
2. Clone your new repo
3. Add a git remote: `git remote add https://github.com/wearpants/skeleton skeleton`
4. Fetch updates: `git fetch skeleton`
5. Merge: `git merge skeleton/master --allow-unrelated-histories`
6. Resolve conflicts and commit.
7. Replace all template values: `grep -r SKELETON *`
8. Commit.

To pull changes in the future, do steps 4-8.
