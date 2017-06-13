SOURCES     := sgx_analysis_framework.tex
OUTPUT_DIRS := build
ALL         := $(SOURCES:%.tex=%.pdf)
AUX_SRC     := $(SOURCES:%.tex=%.aux)
HOST 		:= $(shell uname)

all : $(ALL)

OPEN:=acroread

ifeq ($(HOST),Darwin)
	OPEN := open
endif

LATEX=pdflatex
BIBTEX=bibtex

%.pdf : %.tex | build_dir
	$(LATEX) -output-directory $(OUTPUT_DIRS) $<
	$(BIBTEX) $(OUTPUT_DIRS)/$(AUX_SRC)
	$(LATEX) -output-directory $(OUTPUT_DIRS) $<
	$(LATEX) -output-directory $(OUTPUT_DIRS) $<
	mv $(OUTPUT_DIRS)/*.pdf .
	$(OPEN) $@

.PHONY: build_dir clean

build_dir:
	mkdir -p $(OUTPUT_DIRS)

clean:
	rm -rf $(OUTPUT_DIRS) $(ALL)
