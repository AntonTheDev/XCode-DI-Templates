#!/bin/sh

FILE_TEMPLATE_SOURCE_DIR="./FileTemplates"
FILE_TEMPLATE_DIR="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/Source"

PROJECT_TEMPLATE_SOURCE_DIR="."
PROJECT_TEMPLATE_DIR="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application"

file_template_array=("CollectionCell.xctemplate" "CollectionVC.xctemplate" "DataService.xctemplate" "Service.xctemplate" "VideoVC.xctemplate" "ViewController.xctemplate" "NetworkService.xctemplate")
project_template_array=("XCode-DI.xctemplate" "XCode-DI-Base.xctemplate")

echo ""
echo "INSTALLING Project Templates: "

for project_template in ${project_template_array[@]}
do

rm -f -r "$PROJECT_TEMPLATE_DIR/$project_template"

if cp -R "$PROJECT_TEMPLATE_SOURCE_DIR/$project_template" "$PROJECT_TEMPLATE_DIR/$project_template"
then echo "    - $project_template Template Installed"
else echo "    - $project_template Installation Failed"
fi

done

echo ""
echo "INSTALLING File Templates: "

for file_template in ${file_template_array[@]}
do

rm -f -r "$FILE_TEMPLATE_DIR/$file_template"

if cp -R "$FILE_TEMPLATE_SOURCE_DIR/$file_template" "$FILE_TEMPLATE_DIR/$file_template"
then echo "    - $file_template Template Installed"
else echo "    - $file_template Installation Failed"
fi

done

echo ""
