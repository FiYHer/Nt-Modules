@ECHO OFF

SETlOCAL enabledelayedexpansion

::ָ����ʼ�ļ���
SET DIR="%cd%"
ECHO DIR=%DIR%

SET TOOL_FILE=pdbex.exe

:: ���� /R ��ʾ��Ҫ�������ļ���,ȥ����ʾ���������ļ���
:: %%f ��һ������,�����ڵ�����,�����������ֻ����һ����ĸ���,ǰ�����%%
:: ��������ͨ���,����ָ����׺��,*.*��ʾ�����ļ�

FOR /R %DIR% %%f IN (*.exe) DO ( 
    SET TARGET_FILE=%%f
    SET FILE_DIR=%%~dpf
    SET FILE_NAME_NOT_PATH=%%~nxf
    SET FULL_PATH_NOT_EXT=%%~dpnf

    IF NOT !FILE_NAME_NOT_PATH!==%TOOL_FILE% (

        ECHO ���ɴ���: !FULL_PATH_NOT_EXT!

        CALL %TOOL_FILE% %%%% !TARGET_FILE! -o !FULL_PATH_NOT_EXT! -c -p- -j- -x- -z-
        
        rem GOTO :EOF
    )

)
pause
