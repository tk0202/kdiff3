@ECHO OFF

REM In file "c:\Documents and Settings\<username>\Application
REM Data\Subversion\config" you can change that behavior by
REM modifying "diff3-cmd" line to call KDiff3 instead of
REM automatic merge. Well, you need a batch file actually (based on
REM http://svn.collab.net/repos/svn/trunk/contrib/client-side/diff3wrap.bat):

REM Configure your favorite diff3/merge program here.
if exist "C:\Program Files\KDiff3" (
  SET DIFF3="C:\Program Files\KDiff3\kdiff3.exe"
) else (
  SET DIFF3="C:\Program Files (x86)\KDiff3\kdiff3.exe"
)

REM Subversion provides the paths we need as the ninth, tenth, and eleventh 
REM parameters.  But we only have access to nine parameters at a time, so we
REM shift our nine-parameter window twice to let us get to what we need.
SHIFT
SHIFT
SET MINE=%7
SET OLDER=%8
SET YOURS=%9

REM Call the merge command (change the following line to make sense for
REM your merge program).
%DIFF3% %OLDER% %MINE% %YOURS% -o merged.txt

REM After performing the merge, this script needs to print the contents
REM of the merged file to stdout.  Do that in whatever way you see fit.
REM Return an errorcode of 0 on successful merge, 1 if unresolved conflicts
REM remain in the result.  Any other errorcode will be treated as fatal.

type merged.txt

del merged.txt
