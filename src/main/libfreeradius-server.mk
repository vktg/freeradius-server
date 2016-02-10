TARGET	:= libfreeradius-server.a

SOURCES	:=	conffile.c \
		connection.c \
		evaluate.c \
		exec.c \
		exfile.c \
		log.c \
		parser.c \
		map_proc.c \
		map.c \
		regex.c \
		request.c \
		stats.c \
		threads.c \
		trigger.c \
		tmpl.c \
		util.c \
		version.c \
		pair.c \
		xlat.c

# This lets the linker determine which version of the SSLeay functions to use.
TGT_LDLIBS      := $(OPENSSL_LIBS) $(GPERFTOOLS_FLAGS) $(GPERFTOOLS_LIBS)

TGT_PREREQS	:= libfreeradius-radius.la

ifneq ($(MAKECMDGOALS),scan)
SRC_CFLAGS	+= -DBUILT_WITH_CPPFLAGS=\"$(CPPFLAGS)\" -DBUILT_WITH_CFLAGS=\"$(CFLAGS)\" -DBUILT_WITH_LDFLAGS=\"$(LDFLAGS)\" -DBUILT_WITH_LIBS=\"$(LIBS)\"
endif
