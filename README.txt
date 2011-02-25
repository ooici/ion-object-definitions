==================================================
Ocean Observatories Initiative Cyberinfrastructure
Integrated Observatory Network (ION)
ion-object-definitions
==================================================

Introduction
============
**** Need blurb ****


* =================================================================================
*
* INSTALLING GOOGLE PROTOCOL BUFFER COMPILER - PREREQUISITE
*
* =================================================================================

******************************************************************************************
*NOTE: The project currently requires version 2.3.0 of the Google Protocol Buffer library*
******************************************************************************************

1. Download Google Protocol Buffers from ooici git hub repository:

git clone git://github.com/ooici/protobuf-2.3.0.git

2. cd into the root directory and run "./configure" to configure the package:

3. From w/in the root directory, then type 'make' to compile the package.

4. Run 'make check' to run any self-tests that come with this package.

5. Run 'make install' to install the programs and any data files

6. Place <protobuf_root>/src in your .bash_profile:

GOOGLE_PROTO_BUFFERS=<path_to_protobuff>/protobuf-2.3.0
export GOOGLE_PROTO_BUFFERS
PATH=$GOOGLE_PROTO_BUFFERS/src:$PATH


Source
======
Obtain the eoi-agents project by running:
::
	git clone git@github.com:ooici/ion-object-definitions

NOTE: Unless otherwise noted - all commands should be run from the "ion-object-definitions" directory
::
	cd ion-object-definitions


Dependencies
============
Dependencies are managed using Apache Ivy.  If you haven't installed Ivy, please refer to the "Installing Ivy" section below.

To resolve (process and download) dependencies run:
::
	ant resolve


Compiling
=========
Compile the project by running:
::
	ant compile

Distribution
============
Build the distribution packages for java and python:
::
	ant dist

**NOTE: The distribution ionproto-<ver>.jar and ionproto-<ver>.tar.gz are located in the dist/lib directory



Build.xml
========
All tasks are performed with ant, and are run with:
::
	ant <target>

Tasks can be viewed with the following command:
::
	ant -p

Main targets:

 clean                   --> Clean the project
 clean-ivy-cache         --> Clean the ivy cache
 clean-ooici-cache       --> Clean the ivy cache of the ooici dependencies only
 compile                 --> Compile the project
 deep-clean              --> Cleans both this directory and the ivy cache
 dist                    --> Package Distribution
 javadoc                 --> Generate Javadoc
 ooici_base.clean-more   --> Called at the end of 'clean' - empty by default, override in build.xml to use
 ooici_base.post-dist    --> Called after all actions in the dist target - empty by default, override in build.xml to use
 ooici_base.pre-compile  --> Called before javac compilation - empty by default, override in build.xml to use
 post-compile            --> Called after javac compilation - empty by default, override in build.xml to use
 pre-dist                --> Called before all actions in the dist target - empty by default, override in build.xml to use
 report-deps             --> Generates a report of dependencies
 resolve                 --> Retreive dependencies with ivy
 test-all                --> Runs JUnit tests for all classes ending in 'Test.java')
Default target: dist


IDE Setup
=========
1. Run: ant resolve
2. Make a "existing source" (or similar) project in your IDE of choice and select the src directory of the project.
3. Put all of the jar files in the "lib" directory on the project classpath in your IDE.
** Note - when you "ant clean" the lib directory is wiped out.  If you discover your project not compiling, make sure
there's a lib directory!


**********************************
**********************************

Ivy Installation*
================
1. Download Apache Ivy (OOICI hosted) from: http://ooici.net/packages/ivy.jar

2. Copy/move the ivy.jar to the "lib" directory of your ant installation:
	Mac OSX: you can place the .jar in your user ant configuration -->  ~/.ant/lib/
		or in the root ant installation, usually --> /usr/share/ant/lib/
	Linux/Windows: wherever you have ant installed (check "%ANT_HOME%" if you're not sure)

3. To verify the installation run (from ion-object-definitions directory):
::
	ant resolve

* Full install instructions: http://ant.apache.org/ivy/history/2.2.0-rc1/install.html
