# Write a makefile to compile all .java files in the current directory
# into .class files using javac.
.SUFFIXES: .java .class
.java.class:
	javac $<
CLASSES = $(patsubst %.java,%.class,$(wildcard *.java))
all: $(CLASSES)
run: all
	cat input.txt | java Main
error: all
	cat input-error.txt | java Main	
error2: all
	cat input-error.2.txt | java Main
clean:
	rm -f *.class