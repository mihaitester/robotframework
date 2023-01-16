@echo off

echo Deleting previous results
del /q /f *.xml
del /q /f *.html
pause

python -m robot -v VAR:if -o output1.xml -l log1.html -r report1.xml tests/smoke.robot
python -m robot -v VAR:else -o output2.xml -l log2.html -r report2.xml tests/smoke.robot

python -m robot -v VAR:if -o output3.xml -l log3.html -r report3.xml tests/print.robot
python -m robot -v VAR:else -o output4.xml -l log4.html -r report4.xml tests/print.robot

echo Merging results from same test suites
python -m robot.rebot --merge -o outputA.xml output1.xml output2.xml
python -m robot.rebot --merge -o outputB.xml output3.xml output4.xml

echo Aggregating results into single log
python -m robot.rebot -o output.xml -r report.xml outputA.xml outputB.xml

echo Generating XML with the aggregated results
python -m robot.rebot -R --xunit xunit.xml output.xml