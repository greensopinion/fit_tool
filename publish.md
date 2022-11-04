
## Steps for publishing package

1. Get the latest from the main branch  
`git checkout main`  
`git pull`
2. Dry run publish  
`dart pub publish --dry-run`
3. Tag the release and push to origin  
`git tag -a version/1.0.3 -m ""`
4. Publish  
`dart pub publish`
