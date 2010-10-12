* =================================================================================
*
* INSTALLING GOOGLE PROTOCOL BUFFER COMPILER
*
* =================================================================================

1. Download Google Protocol Buffers from:

http://code.google.com/apis/protocolbuffers/

2. cd into the root directory and run "./configure" to configure the package:

3. From w/in the root directory, then type 'make' to compile the package.

4. Run 'make check' to run any self-tests that come with this package.

5. Run 'make install' to install the programs and any data files

6. Place [protobuf root]/src in your .bash_profile:

GOOGLE_PROTO_BUFFERS=/Users/spasco/apps/protobuf-2.3.0
export GOOGLE_PROTO_BUFFERS
PATH=$GOOGLE_PROTO_BUFFERS/src:$PATH

* =================================================================================
*
* INSTALLING THE MAVEN PROTOC PLUGIN
*
* =================================================================================

1. You'll only need the Maven Protoc Plugin if you're going to use Maven to compile all your
.proto files.

2. Download from GitHub the Maven Protoc Plugin:

git clone http://github.com/dtrott/maven-protoc-plugin.git

4. Go to your [Maven root]/settings.xml and add the following 'pluginRepository':

*************************
Maven root > settings.xml
*************************

<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">

		<profiles>
			<profile>
				<pluginRepositories>
                	<pluginRepository>
                    	<id>dtrott</id>
                		<url>http://maven.davidtrott.com/repository</url>
        			</pluginRepository>
    			</pluginRepositories>
			</profile>
		</profiles>
</settings>

3. Within the plugin project root dir, 'maven-protoc-plugin', run:

mvn clean install

- This will install the maven plugin so it's in the Maven classpath and available
for use by the pom.xml within ion_proto_umbrella.

4. Now, go to 'ion_proto_umbrella' root dir and adjust your pom.xml as need be.

5. Next, from within the 'ion_proto_umbrella" root dir, type 'mvn package'. This will recursively
compile all .proto files to .java files.


* =================================================================================
*
* MAVEN PROTOC PLUGIN SPECIAL NOTE
*
* =================================================================================

The Maven proto plugin expects the .proto files to be under ion_proto_umbrella/src/main/proto.

Make sure the 'net' package is under the src/main/proto dir before attempting to use this plugin.