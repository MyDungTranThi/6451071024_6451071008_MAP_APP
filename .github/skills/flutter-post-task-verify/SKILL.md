---
name: flutter-post-task-verify
description: 'Mandatory post-task verification for Flutter projects. Use when a coding task is finished to run build and run smoke tests, detect compile/runtime errors, and report where errors occur (file/line). Keywords: flutter analyze, flutter build, flutter run, smoke test, verify task completion.'
argument-hint: 'Target platform: windows | android | web (default: windows)'
---

# Flutter Post-Task Verify

Use this skill **immediately after finishing any implementation task**.

## Goal

Ensure code is actually healthy by running:
1. dependency check
2. static analysis
3. tests (if present)
4. build
5. smoke run

If any step fails, report:
- failed step
- key error lines
- likely file and line location

## Inputs

- `target` (optional): `windows` | `android` | `web` (default: `windows`)
- `deviceId` (optional): explicit device ID for `flutter run`
- `smokeSeconds` (optional): seconds to keep app running for smoke check (default: `20`)

## Procedure

1. Run the verification script:
   - [verify_flutter.ps1](./assets/verify_flutter.ps1)
2. Read the summary table produced by the script.
3. Run architecture check for this project:
   - `controller/` must not import from `data/services/`
   - `controller/` should depend on `data/repositories/`
   - if violated, report as architecture failure even when compile passes
4. If failed:
   - collect top error lines from script output
   - extract probable file/line references from analyzer/build/runtime logs
   - propose the minimal next fix
5. In your response, always include:
   - Verification status per step (`pub get`, `analyze`, `test`, `build`, `run smoke`)
   - Architecture status (`MVC + Repository`)
   - First blocking error
   - Where the error happens (`file:line:column` if available)

## Output Format (required)

### Verification Result
- `pub get`: PASS/FAIL
- `analyze`: PASS/FAIL
- `test`: PASS/FAIL/SKIPPED
- `build`: PASS/FAIL
- `run smoke`: PASS/FAIL/SKIPPED
- `architecture (mvc + repository)`: PASS/FAIL

### Blocking Error
- concise message
- key log lines
- probable location(s)

### Next Action
- exact minimal fix direction

## Notes

- For Android smoke run, ensure emulator/device is connected.
- If no test files exist, mark test as `SKIPPED`.
- If CI environment cannot run UI, smoke run may be marked `SKIPPED` with reason.
