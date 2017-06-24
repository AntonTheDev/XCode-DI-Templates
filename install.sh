#!/bin/sh

IOS_FILE_TEMPLATE_SOURCE_DIR="./Source/FileTemplates-iOS"
IOS_FILE_TEMPLATE_DIR="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/Source"

TVOS_FILE_TEMPLATE_SOURCE_DIR="./Source/FileTemplates-tvOS"
TVOS_FILE_TEMPLATE_DIR="/Applications/Xcode.app/Contents/Developer/Platforms/AppleTVOS.platform/Developer/Library/Xcode/Templates/File Templates/Source"

PROJECT_TEMPLATE_SOURCE_DIR="./Source/ProjectTemplates"
PROJECT_TEMPLATE_DIR="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application"

XCODE_SNIPPETS_SOURCE_DIR="./Source/CodeSnippets"
XCODE_SNIPPETS_TARGET_DIR="$HOME/Library/Developer/Xcode/UserData/CodeSnippets"

project_template_array=(
"XCode-DI.xctemplate"
"XCode-DI-Base.xctemplate")

file_template_array=(
"CollectionView Cell.xctemplate"
"Collection ViewController.xctemplate"
"Video ViewController.xctemplate"
"Transitioning Animator.xctemplate"
"View Controller.xctemplate"
"View.xctemplate"
"Network Service.xctemplate"
"Data Service.xctemplate"
"Service.xctemplate"
"Transitioning Container VC.xctemplate")

code_snippet_array=(
"xlabel.codesnippet"
"xbutton.codesnippet"
"ximageview.codesnippet"
"xview.codesnippet"
"xattributedstring.codesnippet")

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
echo "INSTALLING iOS File Templates: "

for file_template in "${file_template_array[@]}"
do

rm -f -r "$IOS_FILE_TEMPLATE_DIR/$file_template"

if cp -R "$IOS_FILE_TEMPLATE_SOURCE_DIR/$file_template" "$IOS_FILE_TEMPLATE_DIR/$file_template"
then echo "    - $file_template Template Installed"
else echo "    - $file_template Installation Failed"
fi

done


echo ""
echo "INSTALLING TVOS File Templates: "

for file_template in "${file_template_array[@]}"
do

rm -f -r "$TVOS_FILE_TEMPLATE_DIR/$file_template"

if cp -R "$TVOS_FILE_TEMPLATE_SOURCE_DIR/$file_template" "$TVOS_FILE_TEMPLATE_DIR/$file_template"
then echo "    - $file_template Template Installed"
else echo "    - $file_template Installation Failed"
fi

done

echo ""


echo "INSTALLING Xcode Snippets: "

for code_template in "${code_snippet_array[@]}"
do

rm -f "$XCODE_SNIPPETS_TARGET_DIR/$code_template"

if cp "$XCODE_SNIPPETS_SOURCE_DIR/$code_template" "$XCODE_SNIPPETS_TARGET_DIR/$code_template"
then echo "    - $code_template Snippet Installed"
else echo "    - $code_template Snippet Failed"
fi

done

echo ""
