TARGET = coreSQLiteStudio
TEMPLATE = lib

CONFIG += create_prl


OBJECTS_DIR = $$OBJECTS_DIR/$$TARGET
MOC_DIR = $$MOC_DIR/$$TARGET
UI_DIR = $$UI_DIR/$$TARGET


DEFINES += CORESQLITESTUDIO_LIBRARY


QT = core script network

!contains(QT_CONFIG, no-pkg-config) {
    CONFIG += link_pkgconfig
    PKGCONFIG += sqlite3
} else {
    LIBS += -lsqlite3
}


win32 {
    LIBS += -lpsapi -limagehlp

    THE_FILE = $$PWD/qt.conf
    THE_DEST = $${DESTDIR}
    THE_FILE ~= s,/,\\,g
    THE_DEST ~= s,/,\\,g
    QMAKE_POST_LINK += $$QMAKE_COPY $$THE_FILE $$THE_DEST $$escape_expand(\\n\\t)
}
macx: {
    out_file = $$DESTDIR/lib $$TARGET .dylib
    QMAKE_POST_LINK += install_name_tool -change libsqlite3.dylib @loader_path/../Frameworks/libsqlite3.dylib $$join(out_file)
    QMAKE_POST_LINK += ; $$QMAKE_MKDIR $$DESTDIR/SQLiteStudio.app
    QMAKE_POST_LINK += ; $$QMAKE_MKDIR $$DESTDIR/SQLiteStudio.app/Contents
    QMAKE_POST_LINK += ; $$QMAKE_COPY $$PWD/Info.plist $$DESTDIR/SQLiteStudio.app/Contents
}
unix: {
    target.path = $$LIBDIR
    INSTALLS += target
}


### ---------------------------------------------------------------------------
TRANSLATIONS += translations/coreSQLiteStudio_de.ts
TRANSLATIONS += translations/coreSQLiteStudio_es.ts
TRANSLATIONS += translations/coreSQLiteStudio_fr.ts
TRANSLATIONS += translations/coreSQLiteStudio_it.ts
TRANSLATIONS += translations/coreSQLiteStudio_pl.ts
TRANSLATIONS += translations/coreSQLiteStudio_pt_BR.ts
TRANSLATIONS += translations/coreSQLiteStudio_ro_RO.ts
TRANSLATIONS += translations/coreSQLiteStudio_ru.ts
TRANSLATIONS += translations/coreSQLiteStudio_sk.ts
TRANSLATIONS += translations/coreSQLiteStudio_zh_CN.ts


### ---------------------------------------------------------------------------
SOURCES += committable.cpp
SOURCES += completioncomparer.cpp
SOURCES += completionhelper.cpp
SOURCES += csvformat.cpp
SOURCES += csvserializer.cpp
SOURCES += datatype.cpp
SOURCES += dbattacher.cpp
SOURCES += dbobjectorganizer.cpp
SOURCES += dbversionconverter.cpp
SOURCES += ddlhistorymodel.cpp
SOURCES += expectedtoken.cpp
SOURCES += exportworker.cpp
SOURCES += importworker.cpp
SOURCES += log.cpp
SOURCES += pluginservicebase.cpp
SOURCES += populateworker.cpp
SOURCES += qio.cpp
SOURCES += querygenerator.cpp
SOURCES += querymodel.cpp
SOURCES += returncode.cpp
SOURCES += schemaresolver.cpp
SOURCES += selectresolver.cpp
SOURCES += sqlhistorymodel.cpp
SOURCES += sqlitestudio.cpp
SOURCES += tablemodifier.cpp
SOURCES += translations.cpp
SOURCES += tsvserializer.cpp
SOURCES += viewmodifier.cpp
SOURCES += common/bistrhash.cpp
SOURCES += common/blockingsocket.cpp
SOURCES += common/column.cpp
SOURCES += common/lazytrigger.cpp
SOURCES += common/memoryusage.cpp
SOURCES += common/nulldevice.cpp
SOURCES += common/private/blockingsocketprivate.cpp
SOURCES += common/readwritelocker.cpp
SOURCES += common/signalwait.cpp
SOURCES += common/table.cpp
SOURCES += common/threadwitheventloop.cpp
SOURCES += common/utils.cpp
SOURCES += common/utils_sql.cpp
SOURCES += common/xmldeserializer.cpp
SOURCES += config_builder/cfgcategory.cpp
SOURCES += config_builder/cfgentry.cpp
SOURCES += config_builder/cfglazyinitializer.cpp
SOURCES += config_builder/cfgmain.cpp
SOURCES += db/abstractdb.cpp
SOURCES += db/asyncqueryrunner.cpp
SOURCES += db/attachguard.cpp
SOURCES += db/chainexecutor.cpp
SOURCES += db/db.cpp
SOURCES += db/dbsqlite3.cpp
SOURCES += db/invaliddb.cpp
SOURCES += db/queryexecutor.cpp
SOURCES += db/sqlerrorcodes.cpp
SOURCES += db/sqlerrorresults.cpp
SOURCES += db/sqlquery.cpp
SOURCES += db/sqlresultsrow.cpp
SOURCES += db/queryexecutorsteps/queryexecutoraddrowids.cpp
SOURCES += db/queryexecutorsteps/queryexecutorattaches.cpp
SOURCES += db/queryexecutorsteps/queryexecutorcellsize.cpp
SOURCES += db/queryexecutorsteps/queryexecutorcolumns.cpp
SOURCES += db/queryexecutorsteps/queryexecutorcountresults.cpp
SOURCES += db/queryexecutorsteps/queryexecutordatasources.cpp
SOURCES += db/queryexecutorsteps/queryexecutordetectschemaalter.cpp
SOURCES += db/queryexecutorsteps/queryexecutorexecute.cpp
SOURCES += db/queryexecutorsteps/queryexecutorexplainmode.cpp
SOURCES += db/queryexecutorsteps/queryexecutorlimit.cpp
SOURCES += db/queryexecutorsteps/queryexecutororder.cpp
SOURCES += db/queryexecutorsteps/queryexecutorparsequery.cpp
SOURCES += db/queryexecutorsteps/queryexecutorreplaceviews.cpp
SOURCES += db/queryexecutorsteps/queryexecutorstep.cpp
SOURCES += db/queryexecutorsteps/queryexecutorvaluesmode.cpp
SOURCES += db/queryexecutorsteps/queryexecutorwrapdistinctresults.cpp
SOURCES += diff/diff_match_patch.cpp
SOURCES += impl/dbattacherimpl.cpp
SOURCES += parser/keywords.cpp
SOURCES += parser/lexer.cpp
SOURCES += parser/lexer_low_lev.cpp
SOURCES += parser/parser.cpp
SOURCES += parser/parser_helper_stubs.cpp
SOURCES += parser/parsercontext.cpp
SOURCES += parser/parsererror.cpp
SOURCES += parser/sqlite2_parse.cpp
SOURCES += parser/sqlite3_parse.cpp
SOURCES += parser/statementtokenbuilder.cpp
SOURCES += parser/token.cpp
SOURCES += parser/ast/sqlitealtertable.cpp
SOURCES += parser/ast/sqliteanalyze.cpp
SOURCES += parser/ast/sqliteattach.cpp
SOURCES += parser/ast/sqlitebegintrans.cpp
SOURCES += parser/ast/sqlitecolumntype.cpp
SOURCES += parser/ast/sqlitecommittrans.cpp
SOURCES += parser/ast/sqliteconflictalgo.cpp
SOURCES += parser/ast/sqlitecopy.cpp
SOURCES += parser/ast/sqlitecreateindex.cpp
SOURCES += parser/ast/sqlitecreatetable.cpp
SOURCES += parser/ast/sqlitecreatetrigger.cpp
SOURCES += parser/ast/sqlitecreateview.cpp
SOURCES += parser/ast/sqlitecreatevirtualtable.cpp
SOURCES += parser/ast/sqlitedeferrable.cpp
SOURCES += parser/ast/sqlitedelete.cpp
SOURCES += parser/ast/sqlitedetach.cpp
SOURCES += parser/ast/sqlitedropindex.cpp
SOURCES += parser/ast/sqlitedroptable.cpp
SOURCES += parser/ast/sqlitedroptrigger.cpp
SOURCES += parser/ast/sqlitedropview.cpp
SOURCES += parser/ast/sqliteemptyquery.cpp
SOURCES += parser/ast/sqliteexpr.cpp
SOURCES += parser/ast/sqliteforeignkey.cpp
SOURCES += parser/ast/sqliteindexedcolumn.cpp
SOURCES += parser/ast/sqliteinsert.cpp
SOURCES += parser/ast/sqlitelimit.cpp
SOURCES += parser/ast/sqliteorderby.cpp
SOURCES += parser/ast/sqlitepragma.cpp
SOURCES += parser/ast/sqlitequery.cpp
SOURCES += parser/ast/sqlitequerytype.cpp
SOURCES += parser/ast/sqliteraise.cpp
SOURCES += parser/ast/sqlitereindex.cpp
SOURCES += parser/ast/sqliterelease.cpp
SOURCES += parser/ast/sqliterollback.cpp
SOURCES += parser/ast/sqlitesavepoint.cpp
SOURCES += parser/ast/sqliteselect.cpp
SOURCES += parser/ast/sqlitesortorder.cpp
SOURCES += parser/ast/sqlitestatement.cpp
SOURCES += parser/ast/sqliteupdate.cpp
SOURCES += parser/ast/sqlitevacuum.cpp
SOURCES += parser/ast/sqlitewith.cpp
SOURCES += plugins/builtinplugin.cpp
SOURCES += plugins/dbpluginsqlite3.cpp
SOURCES += plugins/dbpluginstdfilebase.cpp
SOURCES += plugins/genericexportplugin.cpp
SOURCES += plugins/genericplugin.cpp
SOURCES += plugins/pluginsymbolresolver.cpp
SOURCES += plugins/plugintype.cpp
SOURCES += plugins/populateconstant.cpp
SOURCES += plugins/populatedictionary.cpp
SOURCES += plugins/populaterandom.cpp
SOURCES += plugins/populaterandomtext.cpp
SOURCES += plugins/populatescript.cpp
SOURCES += plugins/populatesequence.cpp
SOURCES += plugins/scriptingqt.cpp
SOURCES += plugins/scriptingqtdbproxy.cpp
SOURCES += plugins/scriptingsql.cpp
SOURCES += plugins/sqlformatterplugin.cpp
SOURCES += rsa/BigInt.cpp
SOURCES += rsa/Key.cpp
SOURCES += rsa/KeyPair.cpp
SOURCES += rsa/PrimeGenerator.cpp
SOURCES += rsa/RSA.cpp
SOURCES += services/bugreporter.cpp
SOURCES += services/codeformatter.cpp
SOURCES += services/config.cpp
SOURCES += services/dbmanager.cpp
SOURCES += services/exportmanager.cpp
SOURCES += services/extralicensemanager.cpp
SOURCES += services/functionmanager.cpp
SOURCES += services/importmanager.cpp
SOURCES += services/notifymanager.cpp
SOURCES += services/populatemanager.cpp
SOURCES += services/updatemanager.cpp
SOURCES += services/impl/collationmanagerimpl.cpp
SOURCES += services/impl/configimpl.cpp
SOURCES += services/impl/dbmanagerimpl.cpp
SOURCES += services/impl/functionmanagerimpl.cpp
SOURCES += services/impl/pluginmanagerimpl.cpp
SOURCES += services/impl/sqliteextensionmanagerimpl.cpp


### ---------------------------------------------------------------------------
HEADERS += committable.h
HEADERS += completioncomparer.h
HEADERS += completionhelper.h
HEADERS += config_builder.h
HEADERS += coreSQLiteStudio_global.h
HEADERS += csvformat.h
HEADERS += csvserializer.h
HEADERS += datatype.h
HEADERS += dbattacher.h
HEADERS += dbobjectorganizer.h
HEADERS += dbobjecttype.h
HEADERS += dbversionconverter.h
HEADERS += ddlhistorymodel.h
HEADERS += dialect.h
HEADERS += expectedtoken.h
HEADERS += exportworker.h
HEADERS += importworker.h
HEADERS += interruptable.h
HEADERS += log.h
HEADERS += pluginservicebase.h
HEADERS += populateworker.h
HEADERS += qio.h
HEADERS += querygenerator.h
HEADERS += querymodel.h
HEADERS += returncode.h
HEADERS += schemaresolver.h
HEADERS += selectresolver.h
HEADERS += sqlhistorymodel.h
HEADERS += sqlitestudio.h
HEADERS += tablemodifier.h
HEADERS += translations.h
HEADERS += tsvserializer.h
HEADERS += viewmodifier.h
HEADERS += common/bihash.h
HEADERS += common/bistrhash.h
HEADERS += common/blockingsocket.h
HEADERS += common/column.h
HEADERS += common/expiringcache.h
HEADERS += common/global.h
HEADERS += common/lazytrigger.h
HEADERS += common/memoryusage.h
HEADERS += common/nulldevice.h
HEADERS += common/objectpool.h
HEADERS += common/readwritelocker.h
HEADERS += common/signalwait.h
HEADERS += common/sortedhash.h
HEADERS += common/sortedset.h
HEADERS += common/strhash.h
HEADERS += common/table.h
HEADERS += common/threadwitheventloop.h
HEADERS += common/unused.h
HEADERS += common/utils.h
HEADERS += common/utils_sql.h
HEADERS += common/valuelocker.h
HEADERS += common/xmldeserializer.h
HEADERS += common/private/blockingsocketprivate.h
HEADERS += config_builder/cfgcategory.h
HEADERS += config_builder/cfgentry.h
HEADERS += config_builder/cfglazyinitializer.h
HEADERS += config_builder/cfgmain.h
HEADERS += db/abstractdb.h
HEADERS += db/abstractdb2.h
HEADERS += db/abstractdb3.h
HEADERS += db/asyncqueryrunner.h
HEADERS += db/attachguard.h
HEADERS += db/chainexecutor.h
HEADERS += db/db.h
HEADERS += db/dbpluginoption.h
HEADERS += db/dbsqlite3.h
HEADERS += db/invaliddb.h
HEADERS += db/queryexecutor.h
HEADERS += db/sqlerrorcodes.h
HEADERS += db/sqlerrorresults.h
HEADERS += db/sqlquery.h
HEADERS += db/sqlresultsrow.h
HEADERS += db/stdsqlite3driver.h
HEADERS += db/queryexecutorsteps/queryexecutoraddrowids.h
HEADERS += db/queryexecutorsteps/queryexecutorattaches.h
HEADERS += db/queryexecutorsteps/queryexecutorcellsize.h
HEADERS += db/queryexecutorsteps/queryexecutorcolumns.h
HEADERS += db/queryexecutorsteps/queryexecutorcountresults.h
HEADERS += db/queryexecutorsteps/queryexecutordatasources.h
HEADERS += db/queryexecutorsteps/queryexecutordetectschemaalter.h
HEADERS += db/queryexecutorsteps/queryexecutorexecute.h
HEADERS += db/queryexecutorsteps/queryexecutorexplainmode.h
HEADERS += db/queryexecutorsteps/queryexecutorlimit.h
HEADERS += db/queryexecutorsteps/queryexecutororder.h
HEADERS += db/queryexecutorsteps/queryexecutorparsequery.h
HEADERS += db/queryexecutorsteps/queryexecutorreplaceviews.h
HEADERS += db/queryexecutorsteps/queryexecutorstep.h
HEADERS += db/queryexecutorsteps/queryexecutorvaluesmode.h
HEADERS += db/queryexecutorsteps/queryexecutorwrapdistinctresults.h
HEADERS += diff/diff_match_patch.h
HEADERS += impl/dbattacherimpl.h
HEADERS += parser/keywords.h
HEADERS += parser/lexer.h
HEADERS += parser/lexer_low_lev.h
HEADERS += parser/parser.h
HEADERS += parser/parser_helper_stubs.h
HEADERS += parser/parsercontext.h
HEADERS += parser/parsererror.h
HEADERS += parser/sqlite2_parse.h
HEADERS += parser/sqlite3_parse.h
HEADERS += parser/statementtokenbuilder.h
HEADERS += parser/token.h
HEADERS += parser/ast/sqlitealtertable.h
HEADERS += parser/ast/sqliteanalyze.h
HEADERS += parser/ast/sqliteattach.h
HEADERS += parser/ast/sqlitebegintrans.h
HEADERS += parser/ast/sqlitecolumntype.h
HEADERS += parser/ast/sqlitecommittrans.h
HEADERS += parser/ast/sqliteconflictalgo.h
HEADERS += parser/ast/sqlitecopy.h
HEADERS += parser/ast/sqlitecreateindex.h
HEADERS += parser/ast/sqlitecreatetable.h
HEADERS += parser/ast/sqlitecreatetrigger.h
HEADERS += parser/ast/sqlitecreateview.h
HEADERS += parser/ast/sqlitecreatevirtualtable.h
HEADERS += parser/ast/sqliteddlwithdbcontext.h
HEADERS += parser/ast/sqlitedeferrable.h
HEADERS += parser/ast/sqlitedelete.h
HEADERS += parser/ast/sqlitedetach.h
HEADERS += parser/ast/sqlitedropindex.h
HEADERS += parser/ast/sqlitedroptable.h
HEADERS += parser/ast/sqlitedroptrigger.h
HEADERS += parser/ast/sqlitedropview.h
HEADERS += parser/ast/sqliteemptyquery.h
HEADERS += parser/ast/sqliteexpr.h
HEADERS += parser/ast/sqliteextendedindexedcolumn.h
HEADERS += parser/ast/sqliteforeignkey.h
HEADERS += parser/ast/sqliteindexedcolumn.h
HEADERS += parser/ast/sqliteinsert.h
HEADERS += parser/ast/sqlitelimit.h
HEADERS += parser/ast/sqliteorderby.h
HEADERS += parser/ast/sqlitepragma.h
HEADERS += parser/ast/sqlitequery.h
HEADERS += parser/ast/sqlitequerytype.h
HEADERS += parser/ast/sqliteraise.h
HEADERS += parser/ast/sqlitereindex.h
HEADERS += parser/ast/sqliterelease.h
HEADERS += parser/ast/sqliterollback.h
HEADERS += parser/ast/sqlitesavepoint.h
HEADERS += parser/ast/sqliteselect.h
HEADERS += parser/ast/sqlitesortorder.h
HEADERS += parser/ast/sqlitestatement.h
HEADERS += parser/ast/sqlitetablerelatedddl.h
HEADERS += parser/ast/sqliteupdate.h
HEADERS += parser/ast/sqlitevacuum.h
HEADERS += parser/ast/sqlitewith.h
HEADERS += plugins/builtinplugin.h
HEADERS += plugins/codeformatterplugin.h
HEADERS += plugins/confignotifiableplugin.h
HEADERS += plugins/dbplugin.h
HEADERS += plugins/dbpluginsqlite3.h
HEADERS += plugins/dbpluginstdfilebase.h
HEADERS += plugins/exportplugin.h
HEADERS += plugins/generalpurposeplugin.h
HEADERS += plugins/genericexportplugin.h
HEADERS += plugins/genericplugin.h
HEADERS += plugins/importplugin.h
HEADERS += plugins/plugin.h
HEADERS += plugins/pluginsymbolresolver.h
HEADERS += plugins/plugintype.h
HEADERS += plugins/populateconstant.h
HEADERS += plugins/populatedictionary.h
HEADERS += plugins/populateplugin.h
HEADERS += plugins/populaterandom.h
HEADERS += plugins/populaterandomtext.h
HEADERS += plugins/populatescript.h
HEADERS += plugins/populatesequence.h
HEADERS += plugins/scriptingplugin.h
HEADERS += plugins/scriptingqt.h
HEADERS += plugins/scriptingqtdbproxy.h
HEADERS += plugins/scriptingsql.h
HEADERS += plugins/sqlformatterplugin.h
HEADERS += plugins/uiconfiguredplugin.h
HEADERS += rsa/BigInt.h
HEADERS += rsa/Key.h
HEADERS += rsa/KeyPair.h
HEADERS += rsa/PrimeGenerator.h
HEADERS += rsa/RSA.h
HEADERS += services/bugreporter.h
HEADERS += services/codeformatter.h
HEADERS += services/collationmanager.h
HEADERS += services/config.h
HEADERS += services/dbmanager.h
HEADERS += services/exportmanager.h
HEADERS += services/extralicensemanager.h
HEADERS += services/functionmanager.h
HEADERS += services/importmanager.h
HEADERS += services/notifymanager.h
HEADERS += services/pluginmanager.h
HEADERS += services/populatemanager.h
HEADERS += services/sqliteextensionmanager.h
HEADERS += services/updatemanager.h
HEADERS += services/impl/collationmanagerimpl.h
HEADERS += services/impl/configimpl.h
HEADERS += services/impl/dbmanagerimpl.h
HEADERS += services/impl/functionmanagerimpl.h
HEADERS += services/impl/pluginmanagerimpl.h
HEADERS += services/impl/sqliteextensionmanagerimpl.h


### ---------------------------------------------------------------------------
OTHER_FILES += ChangeLog.txt
OTHER_FILES += Info.plist
OTHER_FILES += TODO.txt
OTHER_FILES += qt.conf
OTHER_FILES += licenses/diff_match.txt
OTHER_FILES += licenses/fugue_icons.txt
OTHER_FILES += licenses/gpl.txt
OTHER_FILES += licenses/lgpl.txt
OTHER_FILES += licenses/qhexedit.txt
OTHER_FILES += licenses/sqlitestudio_license.txt
OTHER_FILES += parser/lemon.c
OTHER_FILES += parser/lempar.c
OTHER_FILES += parser/run_lemon.sh
OTHER_FILES += parser/sqlite2_parse.y
OTHER_FILES += parser/sqlite3_parse.y


### ---------------------------------------------------------------------------
FORMS += plugins/populateconstant.ui
FORMS += plugins/populatedictionary.ui
FORMS += plugins/populaterandom.ui
FORMS += plugins/populaterandomtext.ui
FORMS += plugins/populatescript.ui
FORMS += plugins/populatesequence.ui


### ---------------------------------------------------------------------------
RESOURCES += coreSQLiteStudio.qrc
