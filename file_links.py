import sublime, sublime_plugin
import os, sys, time

import subprocess

class FileLinkCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        current_file = self.view.file_name()

        if current_file is None:
            return

        main_region = self.view.sel()[0]
        rowcol = self.view.rowcol(main_region.begin())
        line=rowcol[0]+1

        print("FileLinkCommand -> current_file " + str(current_file) + " in rowcol " + str(line))

        create_link_cmd = '${HOME}/workspace/scripts/sublime/create_file_link.sh "' + current_file + '" ' + str(line)
        print(create_link_cmd)
        link_path = subprocess.check_output(create_link_cmd, shell=True)
        link_path = link_path.strip()
        link_path = "file://" + link_path.decode('UTF-8')

        print(link_path)

        sublime.set_clipboard(link_path)


