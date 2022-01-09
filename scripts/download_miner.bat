@echo off

curl -L https://github.com/NebuTech/NBMiner/releases/download/v40.1/NBMiner_40.1_Win.zip -o NBMiner.zip

tar -xf NBMiner.zip
del /F NBMiner.zip
RENAME NBMiner_Win NBMiner