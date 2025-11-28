add_library(glasscommon${QT_MAJOR_VERSION} OBJECT glassboxshadowrenderer.cpp)

set_target_properties(glasscommon${QT_MAJOR_VERSION} PROPERTIES POSITION_INDEPENDENT_CODE TRUE)

target_link_libraries(glasscommon${QT_MAJOR_VERSION}
    PUBLIC
        Qt${QT_MAJOR_VERSION}::Core
        Qt${QT_MAJOR_VERSION}::Gui)
