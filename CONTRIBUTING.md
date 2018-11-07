# Contributing guide

This guide is intended for internal and external contributors.

## Tools

After checking out the repository, install these tools.

### Git secrets

Please install the following two tools in the given order.

We use `git secrets` to prevent secrets from being accidentally committed.

```
brew install git-secrets
cd [your_git_working_copy]
git secrets --install
git secrets --register-aws
```

### Pre-commit checks

We use pre-commit hooks to enforce coding standards and to prevent private keys from being accidentally committed.

```
brew install pre-commit
cd [your_git_working_copy]
pre-commit install --install-hooks
pre-commit autoupdate
```

## Guidelines

Please follow the GDS guidelines for:

* [pull requests](https://github.com/alphagov/styleguides/blob/master/pull-requests.md)

* [commit messages and more](https://github.com/alphagov/styleguides/blob/master/git.md)
