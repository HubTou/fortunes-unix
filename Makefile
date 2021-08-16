# Default action is to show this help message:
.help:
	@echo "Possible targets:"
	@echo "  dat            Generate strfile dat files"
	@echo "  package        Build package"
	@echo "  upload-test    Upload the package to TestPyPi"
	@echo "  upload         Upload the package to PyPi"
	@echo "  distclean      Remove all generated files"

dat: commented

commented:
	strfile -C data/unix-quotes
	strfile -C data/unix-philosophy

love:
	@echo "Not war!"

package: dat
	python -m build

upload-test:
	python -m twine upload --repository testpypi dist/*

upload:
	python -m twine upload dist/*

distclean:
	rm -rf build dist data/*.dat *.egg-info

