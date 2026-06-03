HOW TO PUT THE PANTERA WARDROBES WEBSITE LIVE ON NETLIFY
========================================================

This folder IS the website. To publish a new version on Netlify you have two
easy options. You do NOT need to be technical for either one.


OPTION 1 - Easiest: just drag the folder (no zip needed)
--------------------------------------------------------
1. Log in to Netlify and open the Pantera Wardrobes site.
2. Go to the "Deploys" tab.
3. Drag THIS folder (the one containing this README) onto the
   "drag and drop your site folder here" area on the page.
4. Wait for it to finish. Done.


OPTION 2 - Make a zip first, then drag the zip
----------------------------------------------
1. Double-click the file "make-deploy-zip.command" in this folder.
   - A small window opens, does its work, and tells you when it has finished.
   - The FIRST time you run it, macOS may say the file is "from an
     unidentified developer" and refuse to open it. If that happens:
     right-click (or Control-click) the file, choose "Open", then click
     "Open" again in the box that appears. You only need to do this once.
2. It creates a file called "pantera-wardrobes-deploy.zip" in the main
   "Websites" folder (the folder that holds all three sites).
3. Drag that zip onto the Netlify "Deploys" page.
4. Done.


THE ONE RULE - never right-click the folder and choose "Compress"
-----------------------------------------------------------------
If you right-click this folder and choose "Compress", the Mac tucks everything
inside an extra wrapper folder. Netlify then cannot find the home page and the
whole site shows a "Page not found" (404) error. This is exactly what went
wrong before.

ALWAYS use Option 1 (drag the folder) or Option 2 (the make-deploy-zip.command
file). Both put the home page (index.html) exactly where Netlify expects it.


Note: the deploy script simply bundles this folder up correctly and leaves out
the behind-the-scenes bits (version-control and Mac system files) that Netlify
does not need.
