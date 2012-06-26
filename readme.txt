4biller Installation Steps


Requirements:
1.	Download and install MySQL if you haven’t
2.	Download and install JRE1.6 or more download if you haven’t
3.	Set environment variable “path” to 
		path = path;c:/java/jre1.6/bin



Installation

Extract 4biller.zip into your location support “c:/4biller”


Database Setup
1.	Install MySQL.
2.	Import database located “c:/4biller/sql/dbDump.sql”. database will be created with name “appbill”

Application Setup
1.	Update “Factory_en_US.properties” with database port, database name, username and password of the database.
2.	You can update your company name into “COMPANY FACTORY” section


Note: Initially username and password of application are blank

