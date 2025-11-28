#####  config classes ææææææ

set(glassdecoration_config_SRCS
  ../glassexceptionlist.cpp
    glassconfigwidget.cpp
    glassdetectwidget.cpp
    glassexceptiondialog.cpp
    glassexceptionlistwidget.cpp
    glassexceptionmodel.cpp
    glassitemmodel.cpp
)
ki18n_wrap_ui(glassdecoration_config_SRCS
    ui/glassconfigurationui.ui
    ui/glassdetectwidget.ui
    ui/glassexceptiondialog.ui
    ui/glassexceptionlistwidget.ui
)

kcoreaddons_add_plugin(kcm_glassdecoration SOURCES kcm_glassdecoration.cpp ${glassdecoration_config_SRCS} INSTALL_NAMESPACE "${KDECORATION_KCM_PLUGIN_DIR}")
kconfig_add_kcfg_files(kcm_glassdecoration ../glasssettings.kcfgc)
target_include_directories(kcm_glassdecoration PRIVATE ${CMAKE_SOURCE_DIR}/kdecoration ${CMAKE_BINARY_DIR}/kdecoration/)
target_link_libraries(kcm_glassdecoration
     PUBLIC
        Qt6::Core
        Qt6::Gui
        Qt6::DBus
        KDecoration3::KDecoration
     PRIVATE
        KF6::CoreAddons
        KF6::ConfigWidgets
        KF6::GuiAddons
        KF6::I18n
        KF6::IconThemes
        KF6::WindowSystem
        KF6::KCMUtils
)
kcmutils_generate_desktop_file(kcm_glassdecoration)
