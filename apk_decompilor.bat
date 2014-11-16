@echo off

set APK_TOOL_COMMAND="apktool\apktool.bat"
set DEX2JAR_COMMAND="dex2jar-0.0.9.8\dex2jar.bat"
set JD_GUI_COMMAND="jd-gui-0.3.3.windows\jd-gui.exe"
set INPUT_APK=%1

if not exist %INPUT_APK% (
    echo APK file does not exist.
) else (
    echo Decompiling %INPUT_APK% ...
    echo Decompiling resources ...
    call %APK_TOOL_COMMAND% d -s -f "%INPUT_APK%" "%INPUT_APK:.apk=%"
    echo Finished decompiling resources ...
    echo Decompiling classes ...
    call %DEX2JAR_COMMAND% "%INPUT_APK:.apk=%\classes.dex"
    echo Finished decompiling classes ...
    %JD_GUI_COMMAND% "%INPUT_APK:.apk=%\classes_dex2jar.jar"
)
