# message("PROJECT_DIR:" $$SS3_PROJECT_DIR)
# message("BUILD_DIR:" $$SS3_BUILD_DIR)

TEMPLATE = subdirs

SUBDIRS += gui
gui.subdir = guiSQLiteStudio
# gui.depends = core

SUBDIRS += core
core.subdir = coreSQLiteStudio



# SUBDIRS += cli
# cli.subdir = sqlitestudiocli
# cli.depends = core
#
# SUBDIRS += gui_app
# gui_app.subdir = sqlitestudio
# gui_app.depends = gui

# if (contains(DEFINES, tests)) {
#     SUBDIRS += tests
#     tests.subdir = Tests
#     tests.depends =
#     message("adding tests")
# }

macx: {
    bundle.commands = sh $$PWD/create_macosx_bundle.sh $$PWD/../$$OUTPUT_DIR_NAME $$QMAKE_QMAKE
    dmg.commands = sh $$PWD/create_macosx_bundle.sh $$PWD/../$$OUTPUT_DIR_NAME $$QMAKE_QMAKE dmg
    pkg.commands = sh $$PWD/create_macosx_bundle.sh $$PWD/../$$OUTPUT_DIR_NAME $$QMAKE_QMAKE dist
    pkg_plugins.commands = sh $$PWD/create_macosx_bundle.sh $$PWD/../$$OUTPUT_DIR_NAME $$QMAKE_QMAKE dist_plugins
    pkg_full.commands = sh $$PWD/create_macosx_bundle.sh $$PWD/../$$OUTPUT_DIR_NAME $$QMAKE_QMAKE dist_full
    QMAKE_EXTRA_TARGETS += bundle dmg pkg pkg_plugins pkg_full
}
