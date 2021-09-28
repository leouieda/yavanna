# Build, package, test, and clean
install:
	pip install -e .[dev]

test:
	pytest $(PYTEST_ARGS) $(PROJECT)

format:
	@echo "Formatting import order with isort..."
	@echo
	@isort .
	@echo
	@echo "Formatting code with black..."
	@echo
	@black .
	@echo
	@echo "Done!"

check:
	@echo "Checking black code formatting..."
	@echo
	@black --check .
	@echo
	@echo "Done!"

clean:
	find . -name "*.pyc" -exec rm -v {} \;
	find . -name "*.orig" -exec rm -v {} \;
	find . -name ".coverage.*" -exec rm -v {} \;
	rm -rvf build dist MANIFEST *.egg-info __pycache__ .coverage .cache .pytest_cache **/_version.py
