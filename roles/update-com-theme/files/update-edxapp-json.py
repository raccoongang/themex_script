#!/usr/bin/python
import sys
import json

json_files_path = sys.argv[1]
json_files_list = [json_files_path + '/lms.env.json',json_files_path + '/cms.env.json']

for json_file in json_files_list:

    json_file_data = open(json_file , "r")

    data = json.load(json_file_data)
    json_file_data.close()

    data['COMPREHENSIVE_THEME_DIR'] = sys.argv[2]
    data['COMPREHENSIVE_THEME_DIRS'] = [sys.argv[3]]
    data['DEFAULT_SITE_THEME'] = sys.argv[4]
    data['ENABLE_COMPREHENSIVE_THEMING'] = 'true'
    data['USE_CUSTOM_THEME'] = 'false'

    with open(json_file, "w") as json_current_file:
        json_current_file.write("{}\n".format(json.dumps(data, indent=4, separators=(',', ': '), sort_keys=True)))
    json_current_file.close()

