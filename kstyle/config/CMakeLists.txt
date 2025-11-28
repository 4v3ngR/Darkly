### configuration plugin
add_definitions(-DTRANSLATION_DOMAIN=\"glass_style_config\")
set(kstyle_glass_config_PART_SRCS glassstyleconfig.cpp)

set(kstyle_glass_config_PART_SRCS ${kstyle_glass_config_PART_SRCS} glassstyleconfigmodule.cpp)

kconfig_add_kcfg_files(kstyle_glass_config_PART_SRCS ../glassstyleconfigdata.kcfgc)
set(kstyle_glass_config_PART_FORMS ui/glassstyleconfig.ui)
ki18n_wrap_ui(kstyle_glass_config_PART_FORMS_HEADERS ${kstyle_glass_config_PART_FORMS})

kcoreaddons_add_plugin(glassstyleconfig SOURCES
    ${kstyle_glass_config_PART_SRCS}
    ${kstyle_glass_config_PART_FORMS_HEADERS}
    INSTALL_NAMESPACE "kstyle_config"
)

target_link_libraries(glassstyleconfig Qt6::Core Qt6::Gui Qt6::Widgets Qt6::DBus)
target_link_libraries(glassstyleconfig KF6::CoreAddons KF6::ConfigCore KF6::ConfigWidgets KF6::I18n)
if(QT_MAJOR_VERSION STREQUAL "6")
    target_link_libraries(glassstyleconfig KF6::KCMUtils)
endif()
kcmutils_generate_desktop_file(glassstyleconfig)

set(glass_settings_SOURCES main.cpp)
add_executable(glass-settings ${glass_settings_SOURCES} )
target_link_libraries(glass-settings Qt6::Core Qt6::Gui Qt6::Widgets )
target_link_libraries(glass-settings KF6::I18n KF6::KCMUtils KF6::CoreAddons)

set_target_properties(glass-settings PROPERTIES OUTPUT_NAME glass-settings${QT_MAJOR_VERSION})

install(TARGETS glass-settings ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})

# icon
ecm_install_icons(ICONS sc-apps-glass-settings.svgz
    DESTINATION ${KDE_INSTALL_ICONDIR}
    THEME hicolor )


