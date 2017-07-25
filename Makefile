SOURCES     := $(wildcard *.tex) $(wildcard *.bib)
MAIN_SRC    := us-17-Swami-SGX-Remote-Attestation-Is-Not-Sufficient-wp.tex
OUTPUT_DIRS := build
ALL         := us-17-Swami-SGX-Remote-Attestation-Is-Not-Sufficient-wp.pdf
AUX_SRC     := $(MAIN_SRC:%.tex=%.aux)
HOST 		:= $(shell uname)

all : $(ALL)

OPEN:=acroread

ifeq ($(HOST),Darwin)
	OPEN := open
endif

LATEX=pdflatex
BIBTEX=bibtex

$(ALL) : $(SOURCES) | build_dir
	$(LATEX) -output-directory $(OUTPUT_DIRS) $(MAIN_SRC)
	$(BIBTEX) $(OUTPUT_DIRS)/$(AUX_SRC)
	$(LATEX) -output-directory $(OUTPUT_DIRS) $(MAIN_SRC)
	$(LATEX) -output-directory $(OUTPUT_DIRS) $(MAIN_SRC)
	mv $(OUTPUT_DIRS)/*.pdf .
	$(OPEN) $@

.PHONY: build_dir clean

build_dir:
	mkdir -p $(OUTPUT_DIRS)

clean:
	rm -rf $(OUTPUT_DIRS) $(ALL)
