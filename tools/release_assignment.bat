@echo off
set p=C:\Anaconda3
call %p%\Scripts\activate.bat %p%
call conda activate cmvs
call python "%cd%\tools\print_assignments.py"
call python "%cd%\tools\release_assignment.py"
pause