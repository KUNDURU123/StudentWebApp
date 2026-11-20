
@echo off

echo =================================
echo STUDENT WEB APPLICATION BUILD
echo =================================

echo Step 1: Cleaning previous build
call mvn clean

echo Step 2: Compiling and packaging
call mvn package -DskipTests

echo =================================
echo BUILD COMPLETED
echo =================================
