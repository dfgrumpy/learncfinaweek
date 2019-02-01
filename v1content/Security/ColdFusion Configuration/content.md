The previous sections focused on secure ColdFusion coding practices, but
if the installation of ColdFusion is configured insecurely, all of that
work is for nothing. Securing the ColdFusion Application Server requires
making the OS, web server, and the ColdFusion configuration secure. For
ColdFusion 9, Adobe published the [Adobe ColdFusion 9 Server Lockdown
Guide](http://wwwimages.adobe.com/www.adobe.com/content/dam/Adobe/en/products/coldfusion/pdfs/91025512-cf9-lockdownguide-wp-ue.pdf)
which covered how to properly configure ColdFusion 9 on Windows or
Linux. It covered various OS settings, connecting ColdFusion to IIS or
Apache, and settings within the ColdFusion Administrator.

Secure Profile
--------------

ColdFusion 10 introduced the Secure Profile that can be enabled during
installation. It simplifies securing ColdFusion by applying more secure
defaults to the configuration instead of having to apply them manually.
Some of the settings changes are:

-   Disables the RDS service
-   Enables separate username and password for Administrator and RDS
-   Restricts access to ColdFusion Administrator to a list of IP
    addresses
-   Provides default missing template, site-wide error, and request
    queue timeout pages to reduce information leakage
-   Disables all debugging

Adobe recommends using Secure Profile for production or public-facing
servers.

Additional Resources:

-   [Administrator settings affected by enabling Secure
    Profile](http://help.adobe.com/en_US/ColdFusion/10.0/Admin/WSf23b27ebc7b554b629cab0421369741d5a7-7fff.html)

Sandboxing
----------

ColdFusion has had security sandboxing for quite a long time, but is
probably an under utilized option that can help secure ColdFusion
because it is only really useful in Enterprise. Sandboxing allows you to
restrict access to data sources, ColdFusion tags/functions, directories,
and servers/ports on a subdirectory. If a piece of ColdFusion code tries
to access a restricted resource in the sandbox, ColdFusion will throw an
error. The best use of sandboxing is to restrict everything on the
webroot of a server and then only allow what is needed per the
subdirectory (web application).

Additional Resources:

-   [Using sandbox
    security](http://help.adobe.com/en_US/ColdFusion/10.0/Admin/WSc3ff6d0ea77859461172e0811cbf364104-7fc8.html)

More Resources
--------------

### Websites

-   [Security improvements in ColdFusion
    10](http://www.adobe.com/devnet/coldfusion/articles/security-improvements.html)
-   [The Open Web Application Security
    Project](https://www.owasp.org/index.php/Main_Page)

### Books

-   [The Web Application Hacker's Handbook: Finding and Exploiting
    Security Flaws, Second
    Edition](http://www.amazon.com/The-Web-Application-Hackers-Handbook/dp/1118026470)
    by Dafydd Stuttard and Marcus Pinto
-   [SQL Injection Attacks and Defense, Second
    Edition](http://www.amazon.com/Injection-Attacks-Defense-Second-Edition/dp/1597499633)
    by Justin Clarke
-   [XSS Attacks: Cross Site Scripting Exploits and
    Defense](http://www.amazon.com/XSS-Attacks-Scripting-Exploits-Defense/dp/1597491543)
    by Jeremiah Grossman, Robert "RSnake" Hansen, Petko "pdp" D. Petkov
    and Anton Rager

