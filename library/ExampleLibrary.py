import subprocess
import json
import os

class CommandlineResult:
    def __init__(self, stdout, stderr, rc):
        self.stdout = stdout
        self.stderr = stderr
        self.rc = rc

    def __str__(self):
        return json.dumps({"stdout": self.stdout, "stderr": self.stderr, "rc": self.rc})

class ExampleLibrary:

    # help: [ http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#library-scope ]
    ROBOT_LIBRARY_SCOPE = 'SUITE'
    timeout = 15
    encoding = "utf-8"

    def __init__(self):
        self._counter = 0

    def count(self):
        self._counter += 1
        print(self._counter)

    def clear_counter(self):
        self._counter = 0

    def run(self, commandline):
        # help: [ https://docs.python.org/3/library/subprocess.html ]
        proc = subprocess.Popen(commandline, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        outs = ""
        errs = ""
        try:
            outs, errs = proc.communicate(timeout=self.timeout)
        except subprocess.TimeoutExpired:
            proc.kill()
            outs, errs = proc.communicate()
        return CommandlineResult(outs.decode(self.encoding), errs.decode(self.encoding), proc.returncode)

if __name__ == "__main__":
    print(ExampleLibrary().run('cmd.exe /c "echo hello"'))
    os.system("pause")