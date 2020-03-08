.DEFAULT_GOAL := help
SHELL = /bin/bash

python_version = 3.8.2

.PHONY: help  ## Display this message
help:
	@grep -E \
		'^.PHONY: .*?## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ".PHONY: |## "}; {printf "\033[36m%-20s\033[0m %s\n", $$2, $$3}'

.PHONY: install  ## Install the project for local development
install:
	pyenv local $(python_version)
	poetry install
	poetry run pre-commit install

.PHONY: setup  ## Set up global tooling - only do this once per machine
setup:
	pyenv versions | grep $(python_version) || pyenv install $(python_version)
	PYENV_VERSION=$(python_version) python -m pip install pipx
	PYENV_VERSION=$(python_version) pipx upgrade poetry || PYENV_VERSION=$(python_version) pipx install poetry

.PHONY: which-python  ## Show path to the python interpreter
which-python:
	echo "Virtual environment interpreter installed at:"
	poetry run python -c "import sys; print(sys.executable)"

.PHONY: lock  ## Lock dependencies and export a requirements.txt
lock:
	poetry lock
	poetry export -f requirements.txt >requirements_tmp.txt
	mv requirements_tmp.txt requirements.txt

.PHONY: pre-commit  ## Run all pre-commit hooks
pre-commit:
	pre-commit run --all-files


.PHONY: clean  ## Remove temporary and cache files/directories
clean:
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]'`
	rm -f `find . -type f -name '*~'`
	rm -f `find . -type f -name '.*~'`
	rm -f `find . -type f -name '.coverage.*'`
	rm -rf `find . -type d -name '*.egg-info'`
	rm -rf `find . -type d -name 'pip-wheel-metadata'`
	rm -rf `find . -type d -name '.pytest_cache'`
	rm -rf `find . -type d -name '.coverage'`
	rm -rf `find . -type d -name '.mypy_cache'`
	rm -rf `find . -type d -name 'htmlcov'`
	rm -rf `find . -type d -name '.cache'`
	rm -rf *.egg-info
	rm -rf build
