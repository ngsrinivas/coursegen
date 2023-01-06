# Note: if you cannot write directly to AFS, you need to speciy
# the AFSHOST environment variable (include a semi-colon at the end)
# e.g. AFSHOST=tye.coda.cs.cmu.edu:
PUBDIR=/afs/cs.cmu.edu/project/dot-1/public_html_15-744/S07
COURSE = ../../
WEBLIB = "${COURSE}/include/weblib.rb"
RDEPS = pagehead.srhtml bodyhead.srhtml Makefile
STAGING = staging
THISCOURSE = 552-F20
CBIN = "${COURSE}/bin"
ASSIGN=ps_theory1.ps ps_theory2.pdf ps_theory1_soln.pdf ps_tools1.pdf \
	ps_tools1_soln.pdf midterm_soln.pdf ps2 ps_tools2.pdf ps_theory2_soln.pdf
GENPAGES = index.html syllabus.html assignments.html exams.html announcements.html
PUB = $(GENPAGES) $(ASSIGN) 15-744-Spring2007.ics style.css xml.gif dave-ns-notes.ps midterm2004_solutions.pdf

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

