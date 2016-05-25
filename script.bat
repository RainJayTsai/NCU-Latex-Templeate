rd /s /q build
mkdir build

@echo off

IF "%1"=="" (
  set MainFileName=main
) ELSE (
set MainFileName=%1
)
echo %MainFileName%


xelatex -src --interaction=nonstopmode %MainFileName%.tex --output-directory=build -include-directory=build 

bibtex build\%MainFileName% -include-directory=build 

makeindex build\%MainFileName%.idx  

xelatex -src --interaction=nonstopmode %MainFileName%.tex --output-directory=build -include-directory=build 
xelatex -src --interaction=nonstopmode %MainFileName%.tex --output-directory=build -include-directory=build

pause