all: analysis data-preparation

analysis: data-preparation
	$(MAKE) -C src/analysis

data-preparation:
	$(MAKE) -C src/data-preparation