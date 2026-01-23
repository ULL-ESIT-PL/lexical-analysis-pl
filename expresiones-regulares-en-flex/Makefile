subst: subst.c 
	gcc -DYYDEBUG=1 -g -o subst subst.c 
subst.c: subst.l 
	flex -o subst.c -l subst.l
clean:
	- rm -fR subst.c subst -fR subst.dSYM
