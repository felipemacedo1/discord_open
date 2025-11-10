# Contributing to Discord Open

First off, thank you for considering contributing to Discord Open! This project aims to provide a secure, scalable enterprise communication platform.

## Code of Conduct

By participating in this project, you agree to maintain a respectful and collaborative environment.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues to avoid duplicates. When creating a bug report, include:

- **Clear title and description**
- **Steps to reproduce** the behavior
- **Expected behavior**
- **Actual behavior**
- **Screenshots** (if applicable)
- **Environment details** (OS, Flutter version, etc.)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, include:

- **Clear title and description**
- **Use case** - Why is this enhancement useful?
- **Proposed solution** - How should it work?
- **Alternative solutions** - What other approaches did you consider?

### Pull Requests

1. **Fork the repository** and create your branch from `develop`
2. **Follow the coding style** of the project
3. **Write meaningful commit messages**
4. **Add tests** for new functionality
5. **Update documentation** as needed
6. **Ensure CI passes** before requesting review

#### Branch Naming Convention

- `feature/description` - New features
- `fix/description` - Bug fixes
- `docs/description` - Documentation changes
- `refactor/description` - Code refactoring
- `test/description` - Adding tests

#### Commit Message Format

```
type(scope): subject

body (optional)

footer (optional)
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

Example:
```
feat(auth): add SSO support with SAML

Implemented SAML authentication provider for enterprise SSO.
Includes configuration for common identity providers.

Closes #123
```

## Development Setup

### Prerequisites

- Dart SDK `>=3.3.0 <4.0.0`
- Flutter SDK `>=3.19.0`
- Docker & Docker Compose
- PostgreSQL 16+

### Setup Steps

```bash
# Clone the repository
git clone https://github.com/felipemacedo1/discord_open.git
cd discord_open

# Backend setup
cd discord_server
dart pub get
docker-compose up -d
dart bin/main.dart --apply-migrations --role=maintenance
serverpod generate
dart run bin/main.dart

# Frontend setup (in another terminal)
cd discord_flutter
flutter pub get
dart run build_runner build -d
flutter run
```

## Coding Standards

### Dart/Flutter

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `dart format` before committing
- Run `dart analyze` and fix all issues
- Maintain test coverage above 80%

### Architecture

- **Backend**: Follow clean architecture with clear endpoint/model separation
- **Frontend**: Use BLoC pattern for state management
- **Security**: Never commit secrets; use environment variables
- **Testing**: Write unit tests for business logic, integration tests for flows

## Testing

```bash
# Backend tests
cd discord_server
dart test

# Frontend tests
cd discord_flutter
flutter test

# Integration tests
cd discord_flutter
flutter test integration_test
```

## Documentation

- Update README.md for user-facing changes
- Add inline code comments for complex logic
- Update API documentation for endpoint changes
- Include examples in documentation

## Questions?

Feel free to open an issue with the `question` label or reach out to the maintainers.

## Recognition

Contributors will be recognized in the project README and release notes.

Thank you for making Discord Open better! 🎉
