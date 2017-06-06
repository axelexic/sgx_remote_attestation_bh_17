SOURCES     := sgx_analysis_framework.tex
OUTPUT_DIRS := build
ALL         := $(SOURCES:%.tex=%.pdf)

all : $(ALL)

LATEX=pdflatex

%.pdf : %.tex | build_dir
	$(LATEX) -output-directory $(OUTPUT_DIRS) $<
	$(LATEX) -output-directory $(OUTPUT_DIRS) $<
	mv $(OUTPUT_DIRS)/*.pdf .

.PHONY: build_dir clean

build_dir:
	mkdir -p $(OUTPUT_DIRS)

clean:
	rm -rf $(OUTPUT_DIRS) $(ALL)
