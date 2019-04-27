@echo off
cd ../porschan.github.io

echo "remove running"

del index.html,README.md
rd /s /q 2018,2019,about,archives,css,fonts,images,js,links,page,readme,tags

echo "remove successful"

echo "remove running"

echo y|xcopy D:\\Codeware_Git\source.porschan.github.io\public\*.* D:\\Codeware_Git\porschan.github.io\ /s /e /y

echo "copy successful"

cd ../source.porschan.github.io