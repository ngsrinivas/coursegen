# Note: if you cannot write directly to AFS, you need to speciy
# the AFSHOST environment variable (include a semi-colon at the end)
# e.g. AFSHOST=tye.coda.cs.cmu.edu:
RDEPS = pagehead.srhtml bodyhead.srhtml Makefile
STAGING = staging
COURSE = ../../
THISCOURSE = 352-F24
CBIN = "${COURSE}/bin"
# GENPAGES = index.html syllabus.html assignments.html exams.html announcements.html
GENPAGES = index.html syllabus.html
PUB = $(GENPAGES)
WEBLIB = "${COURSE}/include/weblib.rb"

#all: publish
all: local

publish: local
	@echo publishing HTML docs using env. variable AFSHOST = $(AFSHOST)
	@echo Note: you must put a semi-colon at the end. e.g., AFSHOST=tye.code.cs.cmu.edu:
	rsync -avz $(PUB) $(AFSHOST)$(PUBDIR)

local: $(GENPAGES)

index.html announcements.html: announcements.txt

rss2.xml: announcements.txt lectures.txt
	${CBIN}/announce_rss.rb

syllabus.srhtml: lectures.txt syllabus.head syllabus.tail
	${CBIN}/mklectures.rb > syllabus.srhtml

clean:
	rm -f $(GENPAGES) ${STAGING}/${THISCOURSE}/*.html syllabus.srhtml readinglist.srhtml *.ics

.SUFFIXES: .html .srhtml

.srhtml.html: ${RDEPS}
	erb -T 2 -r ${WEBLIB} $< > ${STAGING}/${THISCOURSE}/$@

