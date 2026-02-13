@echo off
rem File: secrets.bat
rem set TOKEN=wlu_xxx
rem set URL=https://xxxx/
call secrets.bat
set "chapters=ch1 ch2 ch3 ch4"

for %%c in (%chapters%) do (
    echo Downloading %%c...
    start curl -H "Authorization: Token %TOKEN%" "%URL%/api/translations/deltarune/%%c/en/file/" -o "./workspace/%%c/imports/text_src/en.json"
    start curl -H "Authorization: Token %TOKEN%" "%URL%/api/translations/deltarune/%%c/zh_Hans/file/" -o "./workspace/%%c/imports/text_src/cn.json"
)