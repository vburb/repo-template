# Template Repository

This serves as a standard template for production level repos. This project is a somewhat opinionated scaffolding & configuration for a Python application managed with poetry.

Additionally, you should be following the standard python style guide located here: https://github.com/kengz/python

## Table of Contents

- [Installation](#installation)
- [Dependencies](#dependencies)
- [Files](#files)
- [Updates](#updates)
- [Github Actions](#github-actions)
- [VS Code Settings](#vs-code-settings)


## Installation

This project requires python>=3.11, though it can be modified to use previous versions.

This project additionally requires that `poetry` is installed.

**Install project & dependencies**

```bash
poetry install
```

**Activate Virtual Environment**

```bash
source .venv/bin/activate # MacOS/Linux

.venv/Scripts/activate.bat # Windows
```

*Note: Poetry allows you to activate the virtual environment via `poetry shell`, but you can only enter the venv like this in one console at a time. Activating via virtual environment bypasses this restriction.*

**Install Pre-Commit Hook**

```bash
pip install pre-commit
pre-commit install
```

## Dependencies

Dev/Test dependencies are discussed in the appropriate sections.
The only hard dependencies for this project is `poetry`.

## Files

- pyproject.toml
    - Contains package information including dependencies & some configuration.
    Dependencies are specified using less precise version restrictions.
- poetry.lock
    - Not included in the template repo. This is because you will have to put your own dependencies and then once you update the `pyproject/toml` file you can run `poetry lock` in terminal.
    - Auto generated file specifying exact dependencies (like a pip freeze). Best practice is to keep this in source control so that deploying the app deploys the exact dependencies used during testing. This file should *not* be edited manually. It will automatically update when changing dependencies or when running `poetry lock`.
- .pre-commit-config.yaml
    - Configuration for pre-commit hooks

## Updates

You will want to update the `package_name` directory with your custom name. There will be down-hill changes in that directories `__init__.py` file as well as the pytests in the `./tests/` directory. However it should be clear using this template how youneed to change them.

No changes are needed to the `./.github/` directory. All the testing is currently done through poetry and has pytest and mypy checkes to pass Github Actions.

## Github Actions

Additionally in the `./.github/` directory is a PR template, users can use for automatic PR checklist for end users. This covers topics like making sure you have add documentation, updated/added pytests, and making sure tests/code performs as expected. This is not a hard requirement for repos, however can be helpful to remind people to update everything before closing PR. 

Finally, there is a `release-drafter.yml` file. This is from the [release-drafter](https://github.com/release-drafter/release-drafter). The purpose of this is to dynamically log and create release notes for Github releases based on PR and commit message history. this template can be updated as needed for our standard naming structure (TBD on standard naming structure) when we release code into github packages for other users to use. 


## VS Code Settings:

```
    // code standards
    "[python]": {
        "editor.formatOnType": true,
        "editor.defaultFormatter": "ms-python.black-formatter",
        "editor.formatOnSave": true,
        "editor.formatOnPaste": true,
        "editor.codeActionsOnSave": {
            "source.organizeImports": "always"
        },
    },
    "black-formatter.args": ["--line-length=250"],
    "isort.args":["--profile", "black"],
    "pylint.lintOnChange": true,
    "pylint.args": ["--max-line-length=250"],
    //github copilot
    "github.copilot.advanced": {},
    "github.copilot.enable": {
        "*": true,
        "plaintext": false,
        "markdown": false,
        "scminput": false
    },
    "github.copilot.editor.enableAutoCompletions": true,
    // notebook settings
    "notebook.output.scrolling": true,
    "notebook.lineNumbers": "on",
    "notebook.output.textLineLimit": 50,
    "workbench.editorAssociations": {
        "*.ipynb": "jupyter-notebook"
    },
    "notebook.cellToolbarLocation": {
        "default": "right",
        "jupyter-notebook": "left"
    },
    "jupyter.askForKernelRestart": false,

```
