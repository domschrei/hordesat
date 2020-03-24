WSPACE = 	..

LGLSRC = 	$(WSPACE)/lingeling
LGLBIN = 	$(WSPACE)/lingeling

CXXFLAGS =	-O3 -g -std=c++11 -Wall -fmessage-length=0 -I$(LGLSRC) -D __STDC_LIMIT_MACROS -D __STDC_FORMAT_MACROS

OBJS =		hordesat.o utilities/ClauseFilter.o solvers/Lingeling.o utilities/ClauseDatabase.o \
			utilities/SatUtils.o utilities/Logger.o sharing/AllToAllSharingManager.o sharing/LogSharingManager.o

LIBS =		-lz -lpthread -L$(LGLBIN) -llgl

TARGET =	hordesat

CXX = 		mpic++

$(TARGET):	$(OBJS)
		$(CXX) -o $(TARGET) $(OBJS) $(LIBS)

all:		$(TARGET)

clean:	rm -f $(OBJS) $(TARGET)
