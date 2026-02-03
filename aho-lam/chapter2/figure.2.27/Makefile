# Write a makefile to compile all .java files in the current directory
# into .class files using javac.
.SUFFIXES: .java .class
.java.class:
	javac $<
CLASSES = $(patsubst %.java,%.class,$(wildcard *.java))
all: $(CLASSES)
run: all
	echo '5+4-3' | java Postfix
error: all
	echo '5+x' | java Postfix
error2: all
	echo '5*y' | java Postfix
clean:
	rm -f *.class