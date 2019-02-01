ColdFusion has the ability to communicate with a number of different
databases, which will be covered later on in this course; for the sample
application we will be working on throughout the course, we will be
using MySQL. If you already have MySQL 4 or 5 already installed, you can
proceed to the 'Install Sample Files' section. If not, follow the steps
below:

Windows
-------

1.  Open up a browser and go to:
    [http://dev.mysql.com/downloads/mysql/](http://dev.mysql.com/downloads/mysql/)
2.  Scroll to the list of available downloads. Click the 'Download'
    button next to the applicable download.
    -   Windows 64 bit - Windows (x86, 64-bit), MSI
    -   Windows 32 bit - Windows (x86, 32-bit), MSI

    If you are unsure, assume you are on a 32 bit machine.
3.  To begin the download, you must either login using pre-existing
    credentials by clicking the 'Proceed' button under the New Users
    section or click the 'No thanks, just start my download' link at the
    bottom of the screen.
4.  Save the file to your desktop.
5.  Double click the file.
6.  On the Welcome screen click 'Next'.
7.  Accept the terms in the license agreement and click 'Next'.
8.  When presented with a list of available Setup Types, Select
    'Typical'.
9.  When ready to install, click 'Install'.
10. If a system message pops up asking if you want the software to be
    installed on your machine, click 'Yes'.
11. If a MySQL enterprise pop up window appears, click 'Next' until it
    disappears.
12. When the Setup Wizard has completed, Click 'Finish'.
13. If you receive another pop up message asking if you want the
    software to be installed on your machine, click 'Yes'.
14. When the Server Instance Configuration Wizard displays, Click
    'Next'.
15. When displayed the available Server Instance Configuration types
    select 'Standard Configuration' and click 'Next'.
16. When on the Windows Options scree, keep 'Install as a Service'
    selected as well as 'Launch the MySQL Server automatically'. Select
    the 'Include Bin Directory in Windows PATH' option and select
    'Next'.
17. On the Security Options scree, specify a new root password and
    select 'Next'. Remember this password as it will be needed later!
18. When the Ready to Execute screen displays, click 'Execute'.
19. After all the Configuration steps have successfully run, Click
    'Finish'.
20. You have successfully installed MySQL.

Mac
---

1.  Open up a browser and go to:
    [http://dev.mysql.com/downloads/mysql/](http://dev.mysql.com/downloads/mysql/)
2.  Scroll to the list of available downloads. Click the 'Download'
    button next to the applicable download.
    -   Mac 64 bit - Mac OS X ver. 10.6 (x86, 64-bit), DMG Archive
    -   Mac 32 bit - Mac OS X ver. 10.6 (x86, 32-bit), DMG Archive

    If you are unsure, assume you are on a 32 bit machine
3.  To begin the download, you must either login using pre-existing
    credentials by clicking the 'Proceed' button under the New Users
    section or click the 'No thanks, just start my download' link at the
    bottom of the screen.
4.  Save the file to your desktop.
5.  Double click the file.
6.  Once the DMG has mounted, double click the
    mysql-5.5.28-osx10.6-x86\_64.pkg (or similar) file. It should be the
    first file in the list.
7.  On the welcome screen, click 'Continue'.
8.  Review the Important Information screen and click 'Continue'.
9.  Review the Software License Agreement and click 'Continue'.
10. Agree to the terms.
11. Select the drive you wish to install the software to and click
    'Continue'.
12. Click 'Install'.
13. Provide your system password and click 'OK'.
14. Once you receive the screen stating the Installation was Successful,
    click 'Close'.
15. Double click the MySQL.prefPane icon.
16. Click 'Install'.
17. If the MySQL server is not running, click the 'Start MySQL Server'
    button.
18. If prompted, provide your system password and click 'OK'.
19. Click the 'Automatically Start MySQL Server on Startup' check box.
20. Close the window.
21. Open up a terminal window and enter the following:\
     /usr/local/mysql/bin/mysqladmin -u root password [NewPassword]
22. Make sure to replace [NewPassword] with the password you wish to use
    for the root user. Remember this password, it will be needed later.
23. Close the Terminal window.
24. You have successfully installed MySQL.

