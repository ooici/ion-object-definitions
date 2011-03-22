==================================================
Ocean Observatories Initiative Cyberinfrastructure
Integrated Observatory Network (ION)
ion-object-definitions
==================================================

Introduction
============
ION Object Definitions is a language independent metadescription of the data objects used for
messages and resources in ION services. Google Protocol Buffers (GPB) provides a complete tool chain
for object specification which can be compiled in python and Java. We have adopted several
conventions for our use of these objects in R1. 

* Each defined object - a GPB 'message' must have a '_MessageTypeIdentifier'
* While GPB does provide 3 possible 'rules' for each message field ION definition use only optional 
and repeated 
* We have defined a field type to act as a null pointer, the link.CASRef

Example Message (net.ooici.play.addressbook.proto):
===================================================

message AddressLink {
  enum _MessageTypeIdentifier {
    _ID = 20003;
    _VERSION = 1;
  }
  repeated net.ooici.core.link.CASRef person = 1;
  optional net.ooici.core.link.CASRef owner = 2;
  optional string title = 3;
}

This example definition uses both rules as well as simple field types and null pointer CASRefs.


(Do once...)
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

**********************************
**********************************

Developer Workflow:
===================

Adding or modifying object definitions has downstream consiquences. Each version of ioncore-python 
and ioncore-java must be tied to a particular version of the object definitions. Otherwise unit 
tests will break where objects are undefined or the usage does not match the definition. To organize
the Type Identifiers we have provided a Google Doc table where the integer values are assigned:

https://spreadsheets.google.com/ccc?key=0AqTqkXCx-C2SdFdPLU5wdEFCalVIUk00S2VqS2xUWVE&hl=en&authkey=CO31mukO

To create a new object for use in a service:
1) Enter a new line in the correct table to reserve a object ID

2) Create or append a proto file with the new object - use the '_MessageTypeIdentifier' to set the
_ID. Until we have operational requirements for backward compatibility, _VERSION is ALWAYS 1.

3) Compile the new object using 'ant compile'

4) Use the dev-integration.cfg buildout configuration to use your new object in ioncore-python (See
the ioncore-python README for more details)
    bin/buildout -c dev-integration.cfg (working dir: ioncore-python)
    
5) Write new service operations and unit tests using the object based on the ion.play.hello_* 
examples of ioncore-python.  Test it with trial.
    bin/trial ion (working dir: ioncore-python)
    
6) Once the code is complete, push the ion-object-definitions to github. The buildbot will compile 
the objects and place a new package on the server for use by other developers.

7) Wait for an email from buildbot notifying you that a new package has
been built.  Locate the patch version of your commit using the buildbot page: 

http://amoeba.ucsd.edu:2222/
____________________________________________________________________________________________________
Packages
Package	         Download	            Git commit hash	                            Last update
ionproto-0.3.12	 ionproto-0.3.12-pl26	95d91fc79917ab1c09305d56ed47ae01833f976f	2011-03-02 17:18:15.431851
____________________________________________________________________________________________________

Copy the package name, version and patch level from the download field an use this value in step 8.


8) Update development.cfg [versions] section in ioncore-python to the
package version created by the build bot.  We are doing this because we
want to tie a version of software (ioncore-python) with a particular version
of protocol buffer defintions (ionproto) so that we can run an older
release of software with the correct protocol buffer definitionsi in the
future.

9) Sanity check: test the new package against ioncore-python
    bin/buildout -c development.cfg (working dir: ioncore-python)
    
10) Rerun bin/trial ion to make sure that the packaged version of ion-objects is correct.
    bin/trial ion (working dir: ioncore-python)
    
11) You need to commit ioncore-python (your change in development.cfg) and push.

*--================================================================================
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
Obtain the ion-object-definitions project by running:
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


