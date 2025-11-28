add_definitions(-DTRANSLATION_DOMAIN="glass_kwin_deco")

################# configuration #################
configure_file(config-glass.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/config-glass.h )

################# includes #################
include_directories(${CMAKE_SOURCE_DIR}/libglasscommon)
include_directories(${CMAKE_BINARY_DIR}/libglasscommon)

################# newt target #################
### plugin classes
set(glassdecoration_SRCS
    glassbutton.cpp
    glassdecoration.cpp
    glassexceptionlist.cpp
    glasssettingsprovider.cpp
)
### build library
kconfig_add_kcfg_files(glassdecoration_SRCS glasssettings.kcfgc)
add_library(glassdecoration MODULE
    ${glassdecoration_SRCS}
    ${glassdecoration_config_SRCS}
    ${glassdecoration_config_PART_FORMS_HEADERS})

set_target_properties(glassdecoration PROPERTIES
    OUTPUT_NAME org.kde.glass
)

target_link_libraries(glassdecoration
     PUBLIC
        Qt6::DBus
        KDecoration3::KDecoration
     PRIVATE
        glasscommon6
        KF6::CoreAddons
        KF6::ConfigWidgets
        KF6::GuiAddons
        KF6::I18n
        KF6::IconThemes
        KF6::WindowSystem
        KF6::KCMUtils
)
install(TARGETS glassdecoration DESTINATION ${KDE_INSTALL_PLUGINDIR}/${KDECORATION_PLUGIN_DIR})
install(FILES config/glassdecorationconfig.desktop DESTINATION  ${KDE_INSTALL_DATADIR}/kservices6)
add_subdirectory(config)
