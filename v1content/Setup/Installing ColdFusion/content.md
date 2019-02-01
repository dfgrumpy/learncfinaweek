To be able to program in ColdFusion, a ColdFusion server needs to be
installed. There are a couple of options available, but the one that we
are going to focus on is a local development server.

A local development server is free and allows you to develop ColdFusion
applications that use all of ColdFusion’s available features. There are,
however, a few limitations, such as not being able to use the server as
an external web server. That being said, there are additional benefits
to using a local ColdFusion development server, such as not needing to
have IIS or Apache installed, but instead using the packaged web server.

To install ColdFusion, follow the steps below:

Windows
-------

1.  Open up a web browser and go to:
    [http://www.adobe.com/go/trycoldfusion/](http://www.adobe.com/go/trycoldfusion/)
2.  Sign in with your Adobe ID. If you do not have an Adobe account,
    click on the "Create an Adobe account" button on the left.
3.  Select the appropriate version of ColdFusion you wish to download.
    If you have a 64 bit system select 'English | Windows 64 bit', else
    select 'English | Windows'.
4.  Click "Download".
5.  Save the file to your desktop.
6.  Once downloaded, double click the file.
7.  Click "Next".
8.  Accept the terms and click "Next".
9.  When you see the screen below, select "Developer Edition" and click
    "Next".\
     ![](/assets/img/windows_cf_install.png)
10. Select Server configuration and click "Next".
11. Leave all checkboxes selected and click "Next".
12. Leave the "Enable Secure Profile" checkbox unchecked and click
    "Next".
13. Provide a password and click "Next". Make sure you remember the
    password!
14. Leave the location at C:\\ColdFusion10\\ and click "Next". If you
    want to install in a different location you can, but it is important
    to note that the install instructions will always reference
    C:\\ColdFusion10.
15. Select 'Built-in web server (Development use only)' and click
    "Next".
16. Provide a password and click "Next". Make sure you remember the
    password; you will need this later on in the install process.
17. Select 'Enable RDS', provide a password and click "Next". Make sure
    you remember the password!
18. Leave the 'Automatically check for server updates' selected and
    click "Next".
19. Click "Install".
20. If you receive any Windows firewall messages, click 'Allow'.
21. When the installation wizard is done, keep the 'Launch the
    Configuration Wizard in the default browser' selected and click
    "Done".
22. A browser window will open. Enter your ColdFusion Administrator
    Password and click "Login". (This is the password from step 16)
23. Once you receive the 'Setup Complete' screen, click the "OK" button.
24. You will now see the ColdFusion Administrator screen. To access this
    screen at a later date, you can go to:
    [http://localhost:8500/CFIDE/administrator/index.cfm](http://localhost:8500/CFIDE/administrator/index.cfm)
25. You have now successfully installed ColdFusion 10. To access the web
    root, you can go to: <http://localhost:8500/>. The web root on the
    file system is C:\\ColdFusion10\\cfusion\\wwwroot\\.

Mac
---

1.  Open up a web browser and go to:
    [http://www.adobe.com/go/trycoldfusion/](http://www.adobe.com/go/trycoldfusion/)
2.  Sign in with your Adobe ID. If you do not have an Adobe account,
    click on the "Create an Adobe account" button on the left.
3.  Select the English | MAC OS X version of ColdFusion.
4.  Click "Download".
5.  Save the file to your desktop.
6.  Once downloaded, double click the file.
7.  Click "Next".
8.  Accept the terms and click "Next".
9.  When you see the screen below, select "Developer Edition" and click
    "Next". \
     ![](/assets/img/mac_cf_installscreen_small.png)
10. Select Server configuration and click "Next".
11. Leave all checkboxes selected and click "Next".
12. Leave the "Enable Secure Profile" checkbox unchecked and click
    "Next".
13. Provide a password and click "Next". Make sure you remember the
    password!
14. Leave the location at /Applications/ColdFusion10/ and click "Next".
    If you want to install in a different location you can, but it is
    important to note that the install instructions will always
    reference /Applications/ColdFusion10/.
15. Select 'Built-in web server (Development use only)' and click
    "Next".
16. Provide a password and click "Next". Make sure you remember the
    password; you will need this later on in the install process.
17. Select 'Enable RDS', provide a password and click "Next". Make sure
    you remember the password!
18. Leave the 'Automatically check for server updates' selected and
    click "Next".
19. Click "Install".
20. If you receive any Windows firewall messages, click 'Allow'.
21. When the installation wizard is done, keep the 'Launch the
    Configuration Wizard in the default browser' selected and click
    "Done".
22. A browser window will open. Enter your ColdFusion Administrator
    Password and click "Login". (This is the password from step 16)
23. Once you receive the 'Setup Complete' screen, click the "OK" button.
24. You will now see the ColdFusion Administrator screen. To access this
    screen at a later date, you can go to:
    [http://localhost:8500/CFIDE/administrator/index.cfm](http://localhost:8500/CFIDE/administrator/index.cfm)
25. You have now successfully installed ColdFusion 10. To access the web
    root, you can go to: <http://localhost:8500/>. The web root on the
    file system is /Applications/ColdFusion10/cfusion/wwwroot/.

