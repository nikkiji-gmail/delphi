# Contributing to BLE Scanner

Thank you for your interest in contributing to the Windows 11 BLE Scanner project!

## How to Contribute

### Reporting Bugs

If you find a bug, please create an issue with:
- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- System information (Windows version, Delphi version)
- Screenshots if applicable

### Suggesting Enhancements

We welcome feature suggestions! Please:
- Check if the feature already exists
- Describe the feature in detail
- Explain the use case
- Provide examples if possible

### Code Contributions

#### Getting Started

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR-USERNAME/delphi.git
   ```
3. Create a feature branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

#### Development Guidelines

**Code Style**
- Follow Delphi naming conventions
- Use meaningful variable and method names
- Add comments for complex logic
- Keep methods focused and concise

**Example:**
```pascal
// Good
procedure TBLEManager.StartScan;
var
  Device: TBLEDevice;
begin
  if FScanning then
    Exit;
  // Implementation
end;

// Avoid
procedure TBLEManager.ss;
var
  d: TBLEDevice;
begin
  // Unclear naming
end;
```

**Project Structure**
- Keep each class in its own unit file
- Separate UI code from business logic
- Use events for component communication
- Maintain thread safety for async operations

**Documentation**
- Update README.md for new features
- Add XML documentation comments
- Update CHANGELOG.md
- Include usage examples

#### Commit Guidelines

Use clear, descriptive commit messages:

```
Good:
- "Add GATT service discovery feature"
- "Fix memory leak in device list cleanup"
- "Update documentation for connection API"

Avoid:
- "Fix bug"
- "Update"
- "Changes"
```

#### Testing

Before submitting:
1. Build the project without errors
2. Test your changes on Windows 11
3. Verify UI remains responsive
4. Check for memory leaks
5. Test edge cases

#### Pull Request Process

1. Update documentation
2. Add your changes to CHANGELOG.md
3. Test thoroughly
4. Submit PR with clear description
5. Link related issues
6. Wait for code review

**PR Template:**
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement

## Testing
Describe testing performed

## Screenshots
If UI changes, include screenshots

## Checklist
- [ ] Code follows project style
- [ ] Documentation updated
- [ ] CHANGELOG.md updated
- [ ] Tested on Windows 11
- [ ] No memory leaks
```

### Development Setup

**Required Tools:**
- Delphi 13 or later
- Windows 11 SDK
- Git
- Bluetooth LE hardware

**Optional Tools:**
- Delphi IDE Extensions
- Code formatter
- Memory profiler

### Code Review Process

All submissions require review. We review:
- Code quality and style
- Documentation completeness
- Test coverage
- Performance impact
- Breaking changes

### Areas for Contribution

**High Priority:**
- Real WinRT API implementation
- Device connection feature
- GATT profile support
- Error handling improvements

**Medium Priority:**
- UI/UX enhancements
- Performance optimization
- Multi-language support
- Export functionality

**Low Priority:**
- Theme customization
- Advanced filtering
- Statistics/analytics
- Plugin system

### Questions?

Feel free to:
- Open an issue for discussion
- Contact maintainers
- Check existing documentation

## Code of Conduct

### Our Standards

**Positive behavior:**
- Using welcoming language
- Respecting different viewpoints
- Accepting constructive criticism
- Focusing on what's best for the project

**Unacceptable behavior:**
- Harassment or discrimination
- Trolling or insulting comments
- Publishing others' private information
- Unprofessional conduct

### Enforcement

Project maintainers are responsible for enforcing standards and may:
- Remove/edit comments or code
- Temporarily or permanently ban contributors
- Report serious violations

## Attribution

This Contributing guide is adapted from open source best practices.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to BLE Scanner! 🎉
