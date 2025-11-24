#!/usr/bin/env sh

# Exit immediately if a command exits with a non-zero status.
set -e

# 1. Run the build process (compiles React to static files)
echo "Building React application..."
npm run build

# 2. Navigate into the output directory (change 'dist' to 'build' if using CRA)
cd dist

# 3. Initialize the deployment repository
echo "Initializing deployment repository in dist/..."
git init

# 4. Add the remote repository (use the same SSH URL your Pi is using)
# NOTE: Replace [Your_Repo_SSH_URL] with your actual URL!
git remote add origin git@github.com:haddersbadders/raspberry-ripple.git

# 5. Add all the built files
git add -A

# 6. Commit the files
git commit -m 'Deploy to Pi server'

# 7. Force push the contents of the 'dist' folder to the 'main' branch
# This overwrites the previous deployment on the server's tracking branch.
echo "Pushing built files to the main branch..."
git push -f origin main

cd -

echo "✅ Deployment complete! Pi will pull changes in 5 minutes."
