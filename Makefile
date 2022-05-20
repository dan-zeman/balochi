SHELL=/bin/bash

post_udpipe:
	udapy -s my.Balochi < balochi_text_sample.conllu | add_transliteration.pl > bal-ud-test.conllu

