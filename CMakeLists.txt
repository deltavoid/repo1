cmake_minimum_required (VERSION 3.5)

project(repo1
    VERSION 1.0
)



message("CMAKE_PROJECT_NAME: ${CMAKE_PROJECT_NAME}")
message("CMAKE_SOURCE_DIR: ${CMAKE_SOURCE_DIR}")
message("CMAKE_BINARY_DIR: ${CMAKE_BINARY_DIR}")

message("PROJECT_NAME: ${PROJECT_NAME}")
message("PROJECT_SOURCE_DIR: ${PROJECT_SOURCE_DIR}")
message("PROJECT_BINARY_DIR: ${PROJECT_BINARY_DIR}")

message("CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
message("CMAKE_CURRENT_BINARY_DIR: ${CMAKE_CURRENT_BINARY_DIR}")
message("CMAKE_CURRENT_LIST_DIR: ${CMAKE_CURRENT_LIST_DIR}")

message("CMAKE_PREFIX_PATH: ${CMAKE_PREFIX_PATH}")
message("CMAKE_MODULE_PATH: ${CMAKE_MODULE_PATH}")
message("CMAKE_TOOLCHAIN_FILE: ${CMAKE_TOOLCHAIN_FILE}")





#configurations





# dependencies






# targets and directories
add_subdirectory(library1)
add_subdirectory(library1_1)
add_subdirectory(binary1)



# export

# set(CMAKE_INSTALL_INCLUDEDIR include)
# set(CMAKE_INSTALL_LIBDIR lib)


# set(install_cmakedir ${CMAKE_INSTALL_LIBDIR}/cmake/repo1)

install(
    TARGETS
        library1
        library1_1
    EXPORT repo1-export
    LIBRARY DESTINATION lib/repo1
    ARCHIVE DESTINATION lib/repo1
)

install(
    EXPORT repo1-export
    FILE Repo1Targets.cmake
    NAMESPACE Repo1::
    DESTINATION lib/cmake/repo1
)


export(
    EXPORT repo1-export
    FILE ${CMAKE_CURRENT_BINARY_DIR}/Repo1Targets.cmake
    NAMESPACE Repo1::
)

export(PACKAGE Repo1)




include(CMakePackageConfigHelpers)

configure_package_config_file(
    ${CMAKE_CURRENT_LIST_DIR}/Repo1Config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/Repo1Config.cmake
    INSTALL_DESTINATION lib/cmake/repo1
)

# the config.cmake here is not suitable for installation
install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/Repo1Config.cmake
  DESTINATION lib/cmake/repo1
)


write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/Repo1ConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY ExactVersion
)

install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/Repo1ConfigVersion.cmake
  DESTINATION "lib/cmake/repo1"
)


install(
  FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/library1/public/library1.h
  DESTINATION "include/repo1/library1/public"
)

install(
  FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/library1_1/public/library1_1.h
  DESTINATION "include/repo1/library1_1/public"
)



#
# Packaging.
#

# set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
# set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
# set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

# include(CPack)
