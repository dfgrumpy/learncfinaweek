The ARTISTS table in the cfartgallery datasource used for examples is an
excellent example of how **NOT** to store passwords. First, they are
stored in clear text and the column is limited to only 8 characters.

  ARTISTID   EMAIL               THEPASSWORD
  ---------- ------------------- -------------
  4          user@demodata.com   demo
  10         diane@demo.com      demo
  15         me@m.com            admin

The next step most people take is to hash the password and store the
hash in the database (assuming we increase the length of THEPASSWORD to
accommodate it). Hashing provides a one way encoding of a string to a
fixed length string. Below shows what the table would look like if
THEPASSWORD for each user was hashed using MD5.

    <cfset variables.hashedPassword = Hash(form.password) />

  ARTISTID   EMAIL               THEPASSWORD
  ---------- ------------------- ----------------------------------
  4          user@demodata.com   FE01CE2A7FBAC8FAFAED7C982A04E229
  10         diane@demo.com      FE01CE2A7FBAC8FAFAED7C982A04E229
  15         me@m.com            21232F297A57A5A743894A0E4A801FC3

What you'll notice is that the hashed password for both
user@demodata.com and diane@demo.com are still the same. This makes it
easier for the attacker to compromise multiple accounts because the
input password is the same for both accounts. To make the hashes unique
for each user, we need to generate a string to be appended to the
password, or a salt. The salt needs to be unique and randomly generated
for each user. Both the salt and the hashed password need to be stored
in the database. Also, change the hashing algorithm to SHA-512, because
both MD5 and SHA-1 are vulnerable to collision attacks.

    <cfset variables.salt = Hash(GenerateSecretKey("AES"), "SHA-512") /> 
    <!--- could use Rand("SHA1PRNG") instead of GenerateSecertKey() --->

    <cfset variables.hashedPassword = Hash(form.password & variables.salt, "SHA-512") />
    <!--- insert both variables.salt and variables.hashedPassword into table --->

  ----------------------------------------------------------------------------
  ARTISTID   EMAIL               THEPASSWORD            THESALT
  ---------- ------------------- ---------------------- ----------------------
  4          user@demodata.com   457AEB091B4F87EB5D\    1BF869C286A1D2A4B0\
                                  98D9972FB707DBFDC2\    D704C620C365BA60B1\
                                  E687B5C8ADA550C997\    B2457200D5918B1F50\
                                  1B89F3BB3C6F863668\    F7E27806013963E824\
                                  67C5F1F8A7935D9DC6\    D7ADB140994A56298B\
                                  B3BFC4801D97CD9D78\    0F20B6246768612418\
                                  C368DA0022E2022527\    91660224AF2AA91D8C\
                                  A5                     CE

  10         diane@demo.com      2F275B973C5D617F56\    0EDCEE1F72ABD928B1\
                                  A8957F266AE38A20F0\    934EDF6ED0FF963532\
                                  B33DC88143D44F9110\    D023E6E0F2BFD70513\
                                  480000D39E78297A6B\    844489D063AE36CF4F\
                                  FAA739C937379FBA33\    3144117946959075CA\
                                  97DF447142FBC647C6\    49F8E5EAC475A0BE32\
                                  2289ECA51955446563\    4266626BDC06CFEA28\
                                  54                     37

  15         me@m.com            ED0148FBC717B9F121\    C8FE4F050FFE75F6FA\
                                  77BCA92C390A142264\    023FB34105D766BE43\
                                  D0729B7657416E557F\    32EEFA8925676C8803\
                                  9E0BA064893810C474\    FDB849FFDFA1CEFF4E\
                                  5735F88DB85902C2AF\    1407030065DAA55A25\
                                  D09C40841035C10175\    92829B5932C7C97292\
                                  0E570685F7E843F718\    D49FEAEAA282F5CEC9\
                                  F2                     DD
  ----------------------------------------------------------------------------

As you can see, THEPASSWORD for all the users is unique because they
have been salted.

ColdFusion 10 enhanced Hash() by adding an additional parameter to
provide the number of iterations the Hash should be run.

    <cfset variables.numIterarions = 1000 />

    <cfquery name="request.getPwdAndSalt" datasource="cfartgallery">
    SELECT  THEPASSWORD, SALT
    FROM    ARTISTS
    WHERE   EMAIL = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.user#" maxlength="50" />
    </cfquery>

    <cfif request.getPwdAndSalt.RecordCount EQ 1>
        <cfif request.getPwdAndSalt.THEPASSWORD EQ Hash(form.password & request.getPwdAndSalt.SALT, "SHA-512", "utf-8", variables.numIterarions)>
            <cfset SessionRotate() />
            <!--- Password is good --->
        <cfelse>
            <!--- Bad Password --->
        </cfif>
    <cfelse>
        <!--- Bad User --->
    </cfif>

Additional Resources:

-   [OWASP Password Storage Cheat
    Sheet](OWASP%20Password%20Storage%20Cheat%20Sheet)
-   [Using bCrypt in ColdFusion
    10](http://www.aliaspooryorik.com/blog/index.cfm/e/posts.details/post/using-bcrypt-in-coldfusion-10-370)
-   [OWASP Forgot Password Cheat
    Sheet](https://www.owasp.org/index.php/Forgot_Password_Cheat_Sheet)
-   [Why passwords have never been weaker—and crackers have never been
    stronger](http://arstechnica.com/security/2012/08/passwords-under-assault/)

