cmake_minimum_required(VERSION 3.1)
project(457239709 CXX)

find_program(INTLTOOL_MERGE intltool-merge)

set(XML_OUTPUT "${CMAKE_BINARY_DIR}/appdata.xml")

add_custom_command(
    OUTPUT ${XML_OUTPUT}
    COMMAND ${INTLTOOL_MERGE} -x -u
    -c ${CMAKE_BINARY_DIR}/.intltool-merge-cache
    ${CMAKE_SOURCE_DIR}/po
    ${CMAKE_SOURCE_DIR}/org.synfig.SynfigStudio.appdata.xml.in
    ${XML_OUTPUT}
    DEPENDS ${CMAKE_SOURCE_DIR}/org.synfig.SynfigStudio.appdata.xml.in
)

add_custom_target(appdata DEPENDS ${XML_OUTPUT})

add_executable(test hello.cpp)
add_dependencies(test appdata)